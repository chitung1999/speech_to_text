import 'package:flutter/material.dart';
import 'package:speech_to_text/core/constants/app_colors.dart';
import 'package:speech_to_text/core/constants/app_text_styles.dart';
import 'package:speech_to_text/ui/page/bg/bg.dart';
import 'package:speech_to_text/ui/widget/go_back.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryItem {
  final String title;
  final String time;
  final String duration;
  final String transcript;
  final bool pinned;

  const _HistoryItem({
    required this.title,
    required this.time,
    required this.duration,
    required this.transcript,
    this.pinned = false,
  });
}

class _HistoryPageState extends State<HistoryPage> {
  final List<_HistoryItem> _items = const [
    _HistoryItem(
      title: 'Cuộc họp dự án',
      time: 'Hôm nay · 09:20',
      duration: '02:15',
      transcript: 'Nhắc lại action items: Hoàn thiện UI, tích hợp API và chuẩn bị bản demo cho khách vào thứ Sáu...',
      pinned: true,
    ),
    _HistoryItem(
      title: 'Ghi chú cá nhân',
      time: 'Hôm nay · 07:45',
      duration: '00:55',
      transcript: 'Lên kế hoạch tập luyện: chạy 3km, hít đất 30 cái, ăn sáng nhẹ...',
    ),
    _HistoryItem(
      title: 'Tóm tắt cuộc gọi',
      time: 'Hôm qua · 18:05',
      duration: '01:42',
      transcript: 'Khách cần bản báo giá chi tiết và timeline bàn giao. Gửi follow-up email trước 10h sáng mai.',
    ),
    _HistoryItem(
      title: 'Ý tưởng tính năng',
      time: '2 ngày trước',
      duration: '00:36',
      transcript: 'Thêm chế độ học ngoại ngữ: phát âm, chấm điểm và gợi ý sửa lỗi theo thời gian thực.',
    ),
  ];

  final List<String> _filters = const ['Tất cả', 'Đã ghim', 'Hôm nay', 'Tuần này'];
  int _selectedFilter = 0;

  List<_HistoryItem> get _displayItems {
    switch (_selectedFilter) {
      case 1:
        return _items.where((e) => e.pinned).toList();
      default:
        return _items;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: const GoBack(title: 'Lịch sử'),
        body: Container(
          color: AppColors.bgContent,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 18,
                children: [
                  _buildSummary(),
                  _buildFilters(),
                  Expanded(
                    child: ListView.separated(
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

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _summaryTile(Icons.mic_none_outlined, 'Bản ghi', '${_items.length}'),
          _summaryTile(Icons.timer_outlined, 'Tổng thời lượng', '6m 28s'),
          _summaryTile(Icons.cloud_done_outlined, 'Đồng bộ', 'Mới nhất'),
        ],
      ),
    );
  }

  Widget _summaryTile(IconData icon, String label, String value) {
    return Column(
      spacing: 6,
      children: [
        Icon(icon, color: AppColors.iconBottomNavigation, size: 22),
        Text(label, style: AppTextStyles.text_14),
        Text(value, style: AppTextStyles.text_16_700),
      ],
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
            onSelected: (_) => setState(() => _selectedFilter = index),
            selectedColor: AppColors.iconBottomNavigation,
            backgroundColor: AppColors.white,
            side: BorderSide(color: selected ? AppColors.iconBottomNavigation : AppColors.hintText.withValues(alpha: 0.4)),
          );
        }),
      ),
    );
  }

  Widget _buildCard(_HistoryItem item) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgContent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.graphic_eq_rounded, color: AppColors.iconBottomNavigation, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: AppTextStyles.text_18.copyWith(fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.bgContent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            spacing: 6,
                            children: [
                              const Icon(Icons.timer, size: 16, color: AppColors.icon),
                              Text(item.duration, style: AppTextStyles.text_14),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(item.time, style: AppTextStyles.text_14.copyWith(color: AppColors.hintText)),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                item.pinned ? Icons.push_pin : Icons.push_pin_outlined,
                size: 18,
                color: item.pinned ? AppColors.iconBottomNavigation : AppColors.hintText,
              ),
            ],
          ),
          Text(
            item.transcript,
            style: AppTextStyles.text_16.copyWith(height: 1.4),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              _actionButton(Icons.play_arrow_rounded, 'Nghe lại'),
              const SizedBox(width: 10),
              _actionButton(Icons.copy_rounded, 'Sao chép'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgContent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 6,
        children: [
          Icon(icon, size: 18, color: AppColors.icon),
          Text(label, style: AppTextStyles.text_14),
        ],
      ),
    );
  }
}

