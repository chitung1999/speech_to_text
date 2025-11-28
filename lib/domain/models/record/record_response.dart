import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_response.g.dart';

part 'record_response.freezed.dart';

@freezed
abstract class RecordResponse with _$RecordResponse {
  const factory RecordResponse({
    @Default(false) bool status,
    @Default('') String text,
    @Default('') String language,
    @Default('') String command,
  }) = _RecordResponse;

  factory RecordResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordResponseFromJson(json);
}