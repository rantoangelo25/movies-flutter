// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DBFavorite {

 int get id; int get movieId; String get backdropPath; String get posterPath; bool get favorite; double get popularity; DateTime get releaseDate; String get title; String get overview;
/// Create a copy of DBFavorite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DBFavoriteCopyWith<DBFavorite> get copyWith => _$DBFavoriteCopyWithImpl<DBFavorite>(this as DBFavorite, _$identity);

  /// Serializes this DBFavorite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DBFavorite;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DBFavorite&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.movieId, _this.movieId) || other.movieId == _this.movieId)&&(identical(other.backdropPath, _this.backdropPath) || other.backdropPath == _this.backdropPath)&&(identical(other.posterPath, _this.posterPath) || other.posterPath == _this.posterPath)&&(identical(other.favorite, _this.favorite) || other.favorite == _this.favorite)&&(identical(other.popularity, _this.popularity) || other.popularity == _this.popularity)&&(identical(other.releaseDate, _this.releaseDate) || other.releaseDate == _this.releaseDate)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.overview, _this.overview) || other.overview == _this.overview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DBFavorite;
  return Object.hash(runtimeType,_this.id,_this.movieId,_this.backdropPath,_this.posterPath,_this.favorite,_this.popularity,_this.releaseDate,_this.title,_this.overview);
}

@override
String toString() {
  final _this = this as DBFavorite;
  return 'DBFavorite(id: ${_this.id}, movieId: ${_this.movieId}, backdropPath: ${_this.backdropPath}, posterPath: ${_this.posterPath}, favorite: ${_this.favorite}, popularity: ${_this.popularity}, releaseDate: ${_this.releaseDate}, title: ${_this.title}, overview: ${_this.overview})';
}


}

/// @nodoc
abstract mixin class $DBFavoriteCopyWith<$Res>  {
  factory $DBFavoriteCopyWith(DBFavorite value, $Res Function(DBFavorite) _then) = _$DBFavoriteCopyWithImpl;
@useResult
$Res call({
 int id, int movieId, String backdropPath, String posterPath, bool favorite, double popularity, DateTime releaseDate, String title, String overview
});




}
/// @nodoc
class _$DBFavoriteCopyWithImpl<$Res>
    implements $DBFavoriteCopyWith<$Res> {
  _$DBFavoriteCopyWithImpl(this._self, this._then);

  final DBFavorite _self;
  final $Res Function(DBFavorite) _then;

/// Create a copy of DBFavorite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? movieId = null,Object? backdropPath = null,Object? posterPath = null,Object? favorite = null,Object? popularity = null,Object? releaseDate = null,Object? title = null,Object? overview = null,}) {
  return _then(DBFavorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,movieId: null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DBFavorite].
extension DBFavoritePatterns on DBFavorite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DBFavorite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DBFavorite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DBFavorite value)  $default,){
final _that = this;
switch (_that) {
case _DBFavorite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DBFavorite value)?  $default,){
final _that = this;
switch (_that) {
case _DBFavorite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int movieId,  String backdropPath,  String posterPath,  bool favorite,  double popularity,  DateTime releaseDate,  String title,  String overview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DBFavorite() when $default != null:
return $default(_that.id,_that.movieId,_that.backdropPath,_that.posterPath,_that.favorite,_that.popularity,_that.releaseDate,_that.title,_that.overview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int movieId,  String backdropPath,  String posterPath,  bool favorite,  double popularity,  DateTime releaseDate,  String title,  String overview)  $default,) {final _that = this;
switch (_that) {
case _DBFavorite():
return $default(_that.id,_that.movieId,_that.backdropPath,_that.posterPath,_that.favorite,_that.popularity,_that.releaseDate,_that.title,_that.overview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int movieId,  String backdropPath,  String posterPath,  bool favorite,  double popularity,  DateTime releaseDate,  String title,  String overview)?  $default,) {final _that = this;
switch (_that) {
case _DBFavorite() when $default != null:
return $default(_that.id,_that.movieId,_that.backdropPath,_that.posterPath,_that.favorite,_that.popularity,_that.releaseDate,_that.title,_that.overview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DBFavorite extends DBFavorite {
  const _DBFavorite({required this.id, required this.movieId, required this.backdropPath, required this.posterPath, required this.favorite, required this.popularity, required this.releaseDate, required this.title, required this.overview}): super._();
  factory _DBFavorite.fromJson(Map<String, dynamic> json) => _$DBFavoriteFromJson(json);

@override final  int id;
@override final  int movieId;
@override final  String backdropPath;
@override final  String posterPath;
@override final  bool favorite;
@override final  double popularity;
@override final  DateTime releaseDate;
@override final  String title;
@override final  String overview;

/// Create a copy of DBFavorite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DBFavoriteCopyWith<_DBFavorite> get copyWith => __$DBFavoriteCopyWithImpl<_DBFavorite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DBFavoriteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DBFavorite&&(identical(other.id, id) || other.id == id)&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.overview, overview) || other.overview == overview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,movieId,backdropPath,posterPath,favorite,popularity,releaseDate,title,overview);
}

@override
String toString() {
    return 'DBFavorite(id: $id, movieId: $movieId, backdropPath: $backdropPath, posterPath: $posterPath, favorite: $favorite, popularity: $popularity, releaseDate: $releaseDate, title: $title, overview: $overview)';
}


}

/// @nodoc
abstract mixin class _$DBFavoriteCopyWith<$Res> implements $DBFavoriteCopyWith<$Res> {
  factory _$DBFavoriteCopyWith(_DBFavorite value, $Res Function(_DBFavorite) _then) = __$DBFavoriteCopyWithImpl;
@override @useResult
$Res call({
 int id, int movieId, String backdropPath, String posterPath, bool favorite, double popularity, DateTime releaseDate, String title, String overview
});




}
/// @nodoc
class __$DBFavoriteCopyWithImpl<$Res>
    implements _$DBFavoriteCopyWith<$Res> {
  __$DBFavoriteCopyWithImpl(this._self, this._then);

  final _DBFavorite _self;
  final $Res Function(_DBFavorite) _then;

/// Create a copy of DBFavorite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? movieId = null,Object? backdropPath = null,Object? posterPath = null,Object? favorite = null,Object? popularity = null,Object? releaseDate = null,Object? title = null,Object? overview = null,}) {
  return _then(_DBFavorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,movieId: null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,backdropPath: null == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String,posterPath: null == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
