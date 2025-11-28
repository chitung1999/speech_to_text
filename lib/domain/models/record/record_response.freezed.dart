// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordResponse {

 bool get status; String get text; String get language; String get command;
/// Create a copy of RecordResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordResponseCopyWith<RecordResponse> get copyWith => _$RecordResponseCopyWithImpl<RecordResponse>(this as RecordResponse, _$identity);

  /// Serializes this RecordResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.text, text) || other.text == text)&&(identical(other.language, language) || other.language == language)&&(identical(other.command, command) || other.command == command));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,text,language,command);

@override
String toString() {
  return 'RecordResponse(status: $status, text: $text, language: $language, command: $command)';
}


}

/// @nodoc
abstract mixin class $RecordResponseCopyWith<$Res>  {
  factory $RecordResponseCopyWith(RecordResponse value, $Res Function(RecordResponse) _then) = _$RecordResponseCopyWithImpl;
@useResult
$Res call({
 bool status, String text, String language, String command
});




}
/// @nodoc
class _$RecordResponseCopyWithImpl<$Res>
    implements $RecordResponseCopyWith<$Res> {
  _$RecordResponseCopyWithImpl(this._self, this._then);

  final RecordResponse _self;
  final $Res Function(RecordResponse) _then;

/// Create a copy of RecordResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? text = null,Object? language = null,Object? command = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecordResponse].
extension RecordResponsePatterns on RecordResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecordResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecordResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecordResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecordResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecordResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecordResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String text,  String language,  String command)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecordResponse() when $default != null:
return $default(_that.status,_that.text,_that.language,_that.command);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String text,  String language,  String command)  $default,) {final _that = this;
switch (_that) {
case _RecordResponse():
return $default(_that.status,_that.text,_that.language,_that.command);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String text,  String language,  String command)?  $default,) {final _that = this;
switch (_that) {
case _RecordResponse() when $default != null:
return $default(_that.status,_that.text,_that.language,_that.command);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecordResponse implements RecordResponse {
  const _RecordResponse({this.status = false, this.text = '', this.language = '', this.command = ''});
  factory _RecordResponse.fromJson(Map<String, dynamic> json) => _$RecordResponseFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String text;
@override@JsonKey() final  String language;
@override@JsonKey() final  String command;

/// Create a copy of RecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordResponseCopyWith<_RecordResponse> get copyWith => __$RecordResponseCopyWithImpl<_RecordResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecordResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.text, text) || other.text == text)&&(identical(other.language, language) || other.language == language)&&(identical(other.command, command) || other.command == command));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,text,language,command);

@override
String toString() {
  return 'RecordResponse(status: $status, text: $text, language: $language, command: $command)';
}


}

/// @nodoc
abstract mixin class _$RecordResponseCopyWith<$Res> implements $RecordResponseCopyWith<$Res> {
  factory _$RecordResponseCopyWith(_RecordResponse value, $Res Function(_RecordResponse) _then) = __$RecordResponseCopyWithImpl;
@override @useResult
$Res call({
 bool status, String text, String language, String command
});




}
/// @nodoc
class __$RecordResponseCopyWithImpl<$Res>
    implements _$RecordResponseCopyWith<$Res> {
  __$RecordResponseCopyWithImpl(this._self, this._then);

  final _RecordResponse _self;
  final $Res Function(_RecordResponse) _then;

/// Create a copy of RecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? text = null,Object? language = null,Object? command = null,}) {
  return _then(_RecordResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
