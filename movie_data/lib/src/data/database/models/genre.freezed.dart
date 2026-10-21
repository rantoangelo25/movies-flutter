// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DBMovieGenre {

 int get id; int get remoteId; String get name;
/// Create a copy of DBMovieGenre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DBMovieGenreCopyWith<DBMovieGenre> get copyWith => _$DBMovieGenreCopyWithImpl<DBMovieGenre>(this as DBMovieGenre, _$identity);

  /// Serializes this DBMovieGenre to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DBMovieGenre;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DBMovieGenre&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DBMovieGenre;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.name);
}

@override
String toString() {
  final _this = this as DBMovieGenre;
  return 'DBMovieGenre(id: ${_this.id}, remoteId: ${_this.remoteId}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $DBMovieGenreCopyWith<$Res>  {
  factory $DBMovieGenreCopyWith(DBMovieGenre value, $Res Function(DBMovieGenre) _then) = _$DBMovieGenreCopyWithImpl;
@useResult
$Res call({
 int id, int remoteId, String name
});




}
/// @nodoc
class _$DBMovieGenreCopyWithImpl<$Res>
    implements $DBMovieGenreCopyWith<$Res> {
  _$DBMovieGenreCopyWithImpl(this._self, this._then);

  final DBMovieGenre _self;
  final $Res Function(DBMovieGenre) _then;

/// Create a copy of DBMovieGenre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = null,Object? name = null,}) {
  return _then(DBMovieGenre(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: null == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DBMovieGenre].
extension DBMovieGenrePatterns on DBMovieGenre {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DBMovieGenre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DBMovieGenre() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DBMovieGenre value)  $default,){
final _that = this;
switch (_that) {
case _DBMovieGenre():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DBMovieGenre value)?  $default,){
final _that = this;
switch (_that) {
case _DBMovieGenre() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int remoteId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DBMovieGenre() when $default != null:
return $default(_that.id,_that.remoteId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int remoteId,  String name)  $default,) {final _that = this;
switch (_that) {
case _DBMovieGenre():
return $default(_that.id,_that.remoteId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int remoteId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _DBMovieGenre() when $default != null:
return $default(_that.id,_that.remoteId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DBMovieGenre extends DBMovieGenre {
  const _DBMovieGenre({required this.id, required this.remoteId, required this.name}): super._();
  factory _DBMovieGenre.fromJson(Map<String, dynamic> json) => _$DBMovieGenreFromJson(json);

@override final  int id;
@override final  int remoteId;
@override final  String name;

/// Create a copy of DBMovieGenre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DBMovieGenreCopyWith<_DBMovieGenre> get copyWith => __$DBMovieGenreCopyWithImpl<_DBMovieGenre>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DBMovieGenreToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DBMovieGenre&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,name);
}

@override
String toString() {
    return 'DBMovieGenre(id: $id, remoteId: $remoteId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DBMovieGenreCopyWith<$Res> implements $DBMovieGenreCopyWith<$Res> {
  factory _$DBMovieGenreCopyWith(_DBMovieGenre value, $Res Function(_DBMovieGenre) _then) = __$DBMovieGenreCopyWithImpl;
@override @useResult
$Res call({
 int id, int remoteId, String name
});




}
/// @nodoc
class __$DBMovieGenreCopyWithImpl<$Res>
    implements _$DBMovieGenreCopyWith<$Res> {
  __$DBMovieGenreCopyWithImpl(this._self, this._then);

  final _DBMovieGenre _self;
  final $Res Function(_DBMovieGenre) _then;

/// Create a copy of DBMovieGenre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = null,Object? name = null,}) {
  return _then(_DBMovieGenre(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: null == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
