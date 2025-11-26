// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecordResponse _$RecordResponseFromJson(Map<String, dynamic> json) =>
    _RecordResponse(
      status: json['status'] as bool? ?? false,
      text: json['text'] as String? ?? '',
      language: json['language'] as String? ?? '',
    );

Map<String, dynamic> _$RecordResponseToJson(_RecordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'language': instance.language,
    };
