// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => _HistoryItem(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  content: json['content'] as String? ?? '',
  createdDate: json['createdDate'] as String,
);

Map<String, dynamic> _$HistoryItemToJson(_HistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'content': instance.content,
      'createdDate': instance.createdDate,
    };

_HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    _HistoryResponse(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$HistoryResponseToJson(_HistoryResponse instance) =>
    <String, dynamic>{'data': instance.data, 'message': instance.message};
