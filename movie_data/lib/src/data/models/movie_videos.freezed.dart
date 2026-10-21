// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_videos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieVideos {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'results') List<MovieVideo> get results;
/// Create a copy of MovieVideos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieVideosCopyWith<MovieVideos> get copyWith => _$MovieVideosCopyWithImpl<MovieVideos>(this as MovieVideos, _$identity);

  /// Serializes this MovieVideos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieVideos;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieVideos&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.results, _this.results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieVideos;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.results));
}

@override
String toString() {
  final _this = this as MovieVideos;
  return 'MovieVideos(id: ${_this.id}, results: ${_this.results})';
}


}

/// @nodoc
abstract mixin class $MovieVideosCopyWith<$Res>  {
  factory $MovieVideosCopyWith(MovieVideos value, $Res Function(MovieVideos) _then) = _$MovieVideosCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'results') List<MovieVideo> results
});




}
/// @nodoc
class _$MovieVideosCopyWithImpl<$Res>
    implements $MovieVideosCopyWith<$Res> {
  _$MovieVideosCopyWithImpl(this._self, this._then);

  final MovieVideos _self;
  final $Res Function(MovieVideos) _then;

/// Create a copy of MovieVideos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? results = null,}) {
  return _then(MovieVideos(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<MovieVideo>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieVideos].
extension MovieVideosPatterns on MovieVideos {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieVideos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieVideos() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieVideos value)  $default,){
final _that = this;
switch (_that) {
case _MovieVideos():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieVideos value)?  $default,){
final _that = this;
switch (_that) {
case _MovieVideos() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'results')  List<MovieVideo> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieVideos() when $default != null:
return $default(_that.id,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'results')  List<MovieVideo> results)  $default,) {final _that = this;
switch (_that) {
case _MovieVideos():
return $default(_that.id,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'results')  List<MovieVideo> results)?  $default,) {final _that = this;
switch (_that) {
case _MovieVideos() when $default != null:
return $default(_that.id,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieVideos implements MovieVideos {
  const _MovieVideos({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'results') required  List<MovieVideo> results}): _results = results;
  factory _MovieVideos.fromJson(Map<String, dynamic> json) => _$MovieVideosFromJson(json);

@override@JsonKey(name: 'id') final  int id;
 final  List<MovieVideo> _results;
@override@JsonKey(name: 'results') List<MovieVideo> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of MovieVideos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieVideosCopyWith<_MovieVideos> get copyWith => __$MovieVideosCopyWithImpl<_MovieVideos>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieVideosToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieVideos&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'MovieVideos(id: $id, results: $results)';
}


}

/// @nodoc
abstract mixin class _$MovieVideosCopyWith<$Res> implements $MovieVideosCopyWith<$Res> {
  factory _$MovieVideosCopyWith(_MovieVideos value, $Res Function(_MovieVideos) _then) = __$MovieVideosCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'results') List<MovieVideo> results
});




}
/// @nodoc
class __$MovieVideosCopyWithImpl<$Res>
    implements _$MovieVideosCopyWith<$Res> {
  __$MovieVideosCopyWithImpl(this._self, this._then);

  final _MovieVideos _self;
  final $Res Function(_MovieVideos) _then;

/// Create a copy of MovieVideos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? results = null,}) {
  return _then(_MovieVideos(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<MovieVideo>,
  ));
}


}


/// @nodoc
mixin _$MovieVideo {

@JsonKey(name: 'name') String get name;@JsonKey(name: 'key') String get key;@JsonKey(name: 'size') int get size;@JsonKey(name: 'official') bool get official;@JsonKey(name: 'published_at') DateTime get publishedAt;@JsonKey(name: 'id') String get id;
/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieVideoCopyWith<MovieVideo> get copyWith => _$MovieVideoCopyWithImpl<MovieVideo>(this as MovieVideo, _$identity);

  /// Serializes this MovieVideo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieVideo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieVideo&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.official, _this.official) || other.official == _this.official)&&(identical(other.publishedAt, _this.publishedAt) || other.publishedAt == _this.publishedAt)&&(identical(other.id, _this.id) || other.id == _this.id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieVideo;
  return Object.hash(runtimeType,_this.name,_this.key,_this.size,_this.official,_this.publishedAt,_this.id);
}

@override
String toString() {
  final _this = this as MovieVideo;
  return 'MovieVideo(name: ${_this.name}, key: ${_this.key}, size: ${_this.size}, official: ${_this.official}, publishedAt: ${_this.publishedAt}, id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $MovieVideoCopyWith<$Res>  {
  factory $MovieVideoCopyWith(MovieVideo value, $Res Function(MovieVideo) _then) = _$MovieVideoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'key') String key,@JsonKey(name: 'size') int size,@JsonKey(name: 'official') bool official,@JsonKey(name: 'published_at') DateTime publishedAt,@JsonKey(name: 'id') String id
});




}
/// @nodoc
class _$MovieVideoCopyWithImpl<$Res>
    implements $MovieVideoCopyWith<$Res> {
  _$MovieVideoCopyWithImpl(this._self, this._then);

  final MovieVideo _self;
  final $Res Function(MovieVideo) _then;

/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? key = null,Object? size = null,Object? official = null,Object? publishedAt = null,Object? id = null,}) {
  return _then(MovieVideo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieVideo].
extension MovieVideoPatterns on MovieVideo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieVideo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieVideo value)  $default,){
final _that = this;
switch (_that) {
case _MovieVideo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieVideo value)?  $default,){
final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'key')  String key, @JsonKey(name: 'size')  int size, @JsonKey(name: 'official')  bool official, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'id')  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
return $default(_that.name,_that.key,_that.size,_that.official,_that.publishedAt,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'key')  String key, @JsonKey(name: 'size')  int size, @JsonKey(name: 'official')  bool official, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'id')  String id)  $default,) {final _that = this;
switch (_that) {
case _MovieVideo():
return $default(_that.name,_that.key,_that.size,_that.official,_that.publishedAt,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'key')  String key, @JsonKey(name: 'size')  int size, @JsonKey(name: 'official')  bool official, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'id')  String id)?  $default,) {final _that = this;
switch (_that) {
case _MovieVideo() when $default != null:
return $default(_that.name,_that.key,_that.size,_that.official,_that.publishedAt,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieVideo implements MovieVideo {
  const _MovieVideo({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'key') required this.key, @JsonKey(name: 'size') required this.size, @JsonKey(name: 'official') required this.official, @JsonKey(name: 'published_at') required this.publishedAt, @JsonKey(name: 'id') required this.id});
  factory _MovieVideo.fromJson(Map<String, dynamic> json) => _$MovieVideoFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'key') final  String key;
@override@JsonKey(name: 'size') final  int size;
@override@JsonKey(name: 'official') final  bool official;
@override@JsonKey(name: 'published_at') final  DateTime publishedAt;
@override@JsonKey(name: 'id') final  String id;

/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieVideoCopyWith<_MovieVideo> get copyWith => __$MovieVideoCopyWithImpl<_MovieVideo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieVideoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieVideo&&(identical(other.name, name) || other.name == name)&&(identical(other.key, key) || other.key == key)&&(identical(other.size, size) || other.size == size)&&(identical(other.official, official) || other.official == official)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,key,size,official,publishedAt,id);
}

@override
String toString() {
    return 'MovieVideo(name: $name, key: $key, size: $size, official: $official, publishedAt: $publishedAt, id: $id)';
}


}

/// @nodoc
abstract mixin class _$MovieVideoCopyWith<$Res> implements $MovieVideoCopyWith<$Res> {
  factory _$MovieVideoCopyWith(_MovieVideo value, $Res Function(_MovieVideo) _then) = __$MovieVideoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'key') String key,@JsonKey(name: 'size') int size,@JsonKey(name: 'official') bool official,@JsonKey(name: 'published_at') DateTime publishedAt,@JsonKey(name: 'id') String id
});




}
/// @nodoc
class __$MovieVideoCopyWithImpl<$Res>
    implements _$MovieVideoCopyWith<$Res> {
  __$MovieVideoCopyWithImpl(this._self, this._then);

  final _MovieVideo _self;
  final $Res Function(_MovieVideo) _then;

/// Create a copy of MovieVideo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? key = null,Object? size = null,Object? official = null,Object? publishedAt = null,Object? id = null,}) {
  return _then(_MovieVideo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
