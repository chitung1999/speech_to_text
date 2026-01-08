import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_response.g.dart';

part 'history_response.freezed.dart';

@freezed
abstract class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'content') @Default('') String content,
    @JsonKey(name: 'createdDate') required String createdDate,
  }) = _HistoryItem;

  factory HistoryItem.fromJson(Map<String, dynamic> json) =>
      _$HistoryItemFromJson(json);
}

@freezed
abstract class HistoryResponse with _$HistoryResponse {
  const factory HistoryResponse({
    @JsonKey(name: 'data') @Default([]) List<HistoryItem> data,
    @JsonKey(name: 'message') @Default('') String message,
  }) = _HistoryResponse;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
}

