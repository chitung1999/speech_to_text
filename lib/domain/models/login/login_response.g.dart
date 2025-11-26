// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponsew _$LoginResponsewFromJson(Map<String, dynamic> json) =>
    _LoginResponsew(
      username: json['username'] as String? ?? '',
      name: json['name'] as String? ?? '',
      result: json['result'] as bool? ?? false,
    );

Map<String, dynamic> _$LoginResponsewToJson(_LoginResponsew instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'result': instance.result,
    };
