// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
LoginResponse _$LoginResponseFromJson(
  Map<String, dynamic> json
) {
    return _LoginResponsew.fromJson(
      json
    );
}

/// @nodoc
mixin _$LoginResponse {

 String get username; String get name; bool get result;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,name,result);

@override
String toString() {
  return 'LoginResponse(username: $username, name: $name, result: $result)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 String username, String name, bool result
});




}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? name = null,Object? result = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponsew value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponsew() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponsew value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponsew():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponsew value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponsew() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String name,  bool result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponsew() when $default != null:
return $default(_that.username,_that.name,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String name,  bool result)  $default,) {final _that = this;
switch (_that) {
case _LoginResponsew():
return $default(_that.username,_that.name,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String name,  bool result)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponsew() when $default != null:
return $default(_that.username,_that.name,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponsew implements LoginResponse {
  const _LoginResponsew({this.username = '', this.name = '', this.result = false});
  factory _LoginResponsew.fromJson(Map<String, dynamic> json) => _$LoginResponsewFromJson(json);

@override@JsonKey() final  String username;
@override@JsonKey() final  String name;
@override@JsonKey() final  bool result;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponsewCopyWith<_LoginResponsew> get copyWith => __$LoginResponsewCopyWithImpl<_LoginResponsew>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponsewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponsew&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.result, result) || other.result == result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,name,result);

@override
String toString() {
  return 'LoginResponse(username: $username, name: $name, result: $result)';
}


}

/// @nodoc
abstract mixin class _$LoginResponsewCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponsewCopyWith(_LoginResponsew value, $Res Function(_LoginResponsew) _then) = __$LoginResponsewCopyWithImpl;
@override @useResult
$Res call({
 String username, String name, bool result
});




}
/// @nodoc
class __$LoginResponsewCopyWithImpl<$Res>
    implements _$LoginResponsewCopyWith<$Res> {
  __$LoginResponsewCopyWithImpl(this._self, this._then);

  final _LoginResponsew _self;
  final $Res Function(_LoginResponsew) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? name = null,Object? result = null,}) {
  return _then(_LoginResponsew(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
