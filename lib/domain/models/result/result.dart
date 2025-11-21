import 'package:speech_to_text/core/enums/status.dart';

class Result<T> {
  final T data;
  final Status status;

  Result({required this.data, required this.status});
}