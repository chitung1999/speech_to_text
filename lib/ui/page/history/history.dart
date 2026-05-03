import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/core/enums/status.dart';
import 'package:speech_to_text/domain/di/di.dart';
import 'package:speech_to_text/domain/models/history/history_response.dart';
import 'package:speech_to_text/domain/models/result/result.dart';
import 'package:speech_to_text/domain/repositories/remote/remote_data.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/widget/go_back.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final RemoteData _remoteData = getIt<RemoteData>();
  List<HistoryItem> _items = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<String> get _filters => [
    'history.all'.tr(),
    'history.today'.tr(),
    'history.this_week'.tr()
  ];
  int _selectedFilter = 0;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final Result<HistoryResponse> result = await _remoteData.getHistory();

      if (result.status == Status.success && result.data != null) {
        setState(() {
          // Lọc bỏ các item có content rỗng
          _items = result.data!.data.where((item) => item.content.isNotEmpty).toList();
          // Sắp xếp theo thời gian mới nhất trước
          _items.sort((a, b) => b.createdDate.compareTo(a.createdDate));
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'history.load_error'.tr();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'history.error_occurred'.tr(namedArgs: {'error': e.toString()});
        _isLoading = false;
      });
    }
  }

  String _formatTime(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final itemDate = DateTime(date.year, date.month, date.day);
      
      final difference = today.difference(itemDate).inDays;
      
      if (difference == 0) {
        return 'history.today_time'.tr(namedArgs: {'time': DateFormat('HH:mm').format(date)});
      } else if (difference == 1) {
        return 'history.yesterday_time'.tr(namedArgs: {'time': DateFormat('HH:mm').format(date)});
      } else if (difference < 7) {
        return 'history.days_ago'.tr(namedArgs: {'days': difference.toString()});
      } else {
        return DateFormat('dd/MM/yyyy · HH:mm').format(date);
      }
    } catch (e) {
      return dateString;
    }
  }

  bool _isToday(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      return date.year == now.year && date.month == now.month && date.day == now.day;
    } catch (e) {
      return false;
    }
  }

  bool _isThisWeek(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date).inDays;
      return difference < 7;
    } catch (e) {
      return false;
    }
  }

  List<HistoryItem> get _displayItems {
    switch (_selectedFilter) {
      case 1: // Hôm nay
        return _items.where((e) => _isToday(e.createdDate)).toList();
      case 2: // Tuần này
        return _items.where((e) => _isThisWeek(e.createdDate)).toList();
      default: // Tất cả
        return _items;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: GoBack(title: 'history.title'.tr()),
        body: Container(
          color: AppColors.bgContent,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 18,
                children: [
                  _buildFilters(),
                  Expanded(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _errorMessage != null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error_outline, size: 48, color: AppColors.hintText),
                                    const SizedBox(height: 16),
                                    Text(_errorMessage!, style: AppTextStyles.text_16.copyWith(color: AppColors.hintText)),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: _loadHistory,
                                      child: Text('history.try_again'.tr()),
                                    ),
                                  ],
                                ),
                              )
                            : _displayItems.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.history, size: 48, color: AppColors.hintText),
                                        const SizedBox(height: 16),
                                        Text('history.no_history'.tr(), style: AppTextStyles.text_16.copyWith(color: AppColors.hintText)),
                                      ],
                                    ),
                                  )
                                : ListView.separated(
                                    itemCount: _displayItems.length,
                                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                                    itemBuilder: (context, index) => _buildCard(_displayItems[index]),
                                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: List.generate(_filters.length, (index) {
          final bool selected = _selectedFilter == index;
          return ChoiceChip(
            label: Text(
              _filters[index],
              style: AppTextStyles.text_14.copyWith(
                color: selected ? AppColors.white : AppColors.text,
              ),
            ),
            selected: selected,
            onSelected: (_) {
              setState(() => _selectedFilter = index);
            },
            selectedColor: AppColors.iconBottomNavigation,
            backgroundColor: AppColors.white,
            side: BorderSide(color: selected ? AppColors.iconBottomNavigation : AppColors.hintText.withValues(alpha: 0.4)),
          );
        }),
      ),
    );
  }

  Widget _buildCard(HistoryItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            item.content,
            style: AppTextStyles.text_16.copyWith(height: 1.4),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _formatTime(item.createdDate),
                style: AppTextStyles.text_14.copyWith(color: AppColors.hintText),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

