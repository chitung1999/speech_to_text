import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

part 'login_response.freezed.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
  @Default('') String username,
  @Default('') String name,
  @Default('') String token,
  @Default(false) bool result,
  }) = _LoginResponsew;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
  _$LoginResponseFromJson(json);
  }