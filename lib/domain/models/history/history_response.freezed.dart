// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryItem {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'content') String get content;@JsonKey(name: 'createdDate') String get createdDate;
/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryItemCopyWith<HistoryItem> get copyWith => _$HistoryItemCopyWithImpl<HistoryItem>(this as HistoryItem, _$identity);

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,content,createdDate);

@override
String toString() {
  return 'HistoryItem(id: $id, userId: $userId, content: $content, createdDate: $createdDate)';
}


}

/// @nodoc
abstract mixin class $HistoryItemCopyWith<$Res>  {
  factory $HistoryItemCopyWith(HistoryItem value, $Res Function(HistoryItem) _then) = _$HistoryItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'content') String content,@JsonKey(name: 'createdDate') String createdDate
});




}
/// @nodoc
class _$HistoryItemCopyWithImpl<$Res>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._self, this._then);

  final HistoryItem _self;
  final $Res Function(HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? content = null,Object? createdDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryItem].
extension HistoryItemPatterns on HistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _HistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'content')  String content, @JsonKey(name: 'createdDate')  String createdDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.userId,_that.content,_that.createdDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'content')  String content, @JsonKey(name: 'createdDate')  String createdDate)  $default,) {final _that = this;
switch (_that) {
case _HistoryItem():
return $default(_that.id,_that.userId,_that.content,_that.createdDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'content')  String content, @JsonKey(name: 'createdDate')  String createdDate)?  $default,) {final _that = this;
switch (_that) {
case _HistoryItem() when $default != null:
return $default(_that.id,_that.userId,_that.content,_that.createdDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryItem implements HistoryItem {
  const _HistoryItem({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'content') this.content = '', @JsonKey(name: 'createdDate') required this.createdDate});
  factory _HistoryItem.fromJson(Map<String, dynamic> json) => _$HistoryItemFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'content') final  String content;
@override@JsonKey(name: 'createdDate') final  String createdDate;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryItemCopyWith<_HistoryItem> get copyWith => __$HistoryItemCopyWithImpl<_HistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,content,createdDate);

@override
String toString() {
  return 'HistoryItem(id: $id, userId: $userId, content: $content, createdDate: $createdDate)';
}


}

/// @nodoc
abstract mixin class _$HistoryItemCopyWith<$Res> implements $HistoryItemCopyWith<$Res> {
  factory _$HistoryItemCopyWith(_HistoryItem value, $Res Function(_HistoryItem) _then) = __$HistoryItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'content') String content,@JsonKey(name: 'createdDate') String createdDate
});




}
/// @nodoc
class __$HistoryItemCopyWithImpl<$Res>
    implements _$HistoryItemCopyWith<$Res> {
  __$HistoryItemCopyWithImpl(this._self, this._then);

  final _HistoryItem _self;
  final $Res Function(_HistoryItem) _then;

/// Create a copy of HistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? content = null,Object? createdDate = null,}) {
  return _then(_HistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HistoryResponse {

@JsonKey(name: 'data') List<HistoryItem> get data;@JsonKey(name: 'message') String get message;
/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryResponseCopyWith<HistoryResponse> get copyWith => _$HistoryResponseCopyWithImpl<HistoryResponse>(this as HistoryResponse, _$identity);

  /// Serializes this HistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'HistoryResponse(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $HistoryResponseCopyWith<$Res>  {
  factory $HistoryResponseCopyWith(HistoryResponse value, $Res Function(HistoryResponse) _then) = _$HistoryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'data') List<HistoryItem> data,@JsonKey(name: 'message') String message
});




}
/// @nodoc
class _$HistoryResponseCopyWithImpl<$Res>
    implements $HistoryResponseCopyWith<$Res> {
  _$HistoryResponseCopyWithImpl(this._self, this._then);

  final HistoryResponse _self;
  final $Res Function(HistoryResponse) _then;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? message = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryResponse].
extension HistoryResponsePatterns on HistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _HistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  List<HistoryItem> data, @JsonKey(name: 'message')  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
return $default(_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'data')  List<HistoryItem> data, @JsonKey(name: 'message')  String message)  $default,) {final _that = this;
switch (_that) {
case _HistoryResponse():
return $default(_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'data')  List<HistoryItem> data, @JsonKey(name: 'message')  String message)?  $default,) {final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
return $default(_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryResponse implements HistoryResponse {
  const _HistoryResponse({@JsonKey(name: 'data') final  List<HistoryItem> data = const [], @JsonKey(name: 'message') this.message = ''}): _data = data;
  factory _HistoryResponse.fromJson(Map<String, dynamic> json) => _$HistoryResponseFromJson(json);

 final  List<HistoryItem> _data;
@override@JsonKey(name: 'data') List<HistoryItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'message') final  String message;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryResponseCopyWith<_HistoryResponse> get copyWith => __$HistoryResponseCopyWithImpl<_HistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),message);

@override
String toString() {
  return 'HistoryResponse(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$HistoryResponseCopyWith<$Res> implements $HistoryResponseCopyWith<$Res> {
  factory _$HistoryResponseCopyWith(_HistoryResponse value, $Res Function(_HistoryResponse) _then) = __$HistoryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'data') List<HistoryItem> data,@JsonKey(name: 'message') String message
});




}
/// @nodoc
class __$HistoryResponseCopyWithImpl<$Res>
    implements _$HistoryResponseCopyWith<$Res> {
  __$HistoryResponseCopyWithImpl(this._self, this._then);

  final _HistoryResponse _self;
  final $Res Function(_HistoryResponse) _then;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? message = null,}) {
  return _then(_HistoryResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<HistoryItem>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
