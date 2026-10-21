// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieResults {

@JsonKey(name: 'backdrop_path') String? get backdropPath; int get id;@JsonKey(name: 'original_title') String get originalTitle; String get overview;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'media_type') String? get mediaType; bool get adult; String get title;@JsonKey(name: 'original_language') String get originalLanguage;@JsonKey(name: 'genre_ids') List<int> get genreIds; double get popularity;@JsonKey(name: 'release_date', fromJson: _parseDate) DateTime? get releaseDate; bool get video;@JsonKey(name: 'vote_average') double get voteAverage;@JsonKey(name: 'vote_count') int get voteCount;
/// Create a copy of MovieResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieResultsCopyWith<MovieResults> get copyWith => _$MovieResultsCopyWithImpl<MovieResults>(this as MovieResults, _$identity);

  /// Serializes this MovieResults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieResults;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieResults&&(identical(other.backdropPath, _this.backdropPath) || other.backdropPath == _this.backdropPath)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.originalTitle, _this.originalTitle) || other.originalTitle == _this.originalTitle)&&(identical(other.overview, _this.overview) || other.overview == _this.overview)&&(identical(other.posterPath, _this.posterPath) || other.posterPath == _this.posterPath)&&(identical(other.mediaType, _this.mediaType) || other.mediaType == _this.mediaType)&&(identical(other.adult, _this.adult) || other.adult == _this.adult)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.originalLanguage, _this.originalLanguage) || other.originalLanguage == _this.originalLanguage)&&const DeepCollectionEquality().equals(other.genreIds, _this.genreIds)&&(identical(other.popularity, _this.popularity) || other.popularity == _this.popularity)&&(identical(other.releaseDate, _this.releaseDate) || other.releaseDate == _this.releaseDate)&&(identical(other.video, _this.video) || other.video == _this.video)&&(identical(other.voteAverage, _this.voteAverage) || other.voteAverage == _this.voteAverage)&&(identical(other.voteCount, _this.voteCount) || other.voteCount == _this.voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieResults;
  return Object.hash(runtimeType,_this.backdropPath,_this.id,_this.originalTitle,_this.overview,_this.posterPath,_this.mediaType,_this.adult,_this.title,_this.originalLanguage,const DeepCollectionEquality().hash(_this.genreIds),_this.popularity,_this.releaseDate,_this.video,_this.voteAverage,_this.voteCount);
}

@override
String toString() {
  final _this = this as MovieResults;
  return 'MovieResults(backdropPath: ${_this.backdropPath}, id: ${_this.id}, originalTitle: ${_this.originalTitle}, overview: ${_this.overview}, posterPath: ${_this.posterPath}, mediaType: ${_this.mediaType}, adult: ${_this.adult}, title: ${_this.title}, originalLanguage: ${_this.originalLanguage}, genreIds: ${_this.genreIds}, popularity: ${_this.popularity}, releaseDate: ${_this.releaseDate}, video: ${_this.video}, voteAverage: ${_this.voteAverage}, voteCount: ${_this.voteCount})';
}


}

/// @nodoc
abstract mixin class $MovieResultsCopyWith<$Res>  {
  factory $MovieResultsCopyWith(MovieResults value, $Res Function(MovieResults) _then) = _$MovieResultsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'backdrop_path') String? backdropPath, int id,@JsonKey(name: 'original_title') String originalTitle, String overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'media_type') String? mediaType, bool adult, String title,@JsonKey(name: 'original_language') String originalLanguage,@JsonKey(name: 'genre_ids') List<int> genreIds, double popularity,@JsonKey(name: 'release_date', fromJson: _parseDate) DateTime? releaseDate, bool video,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount
});




}
/// @nodoc
class _$MovieResultsCopyWithImpl<$Res>
    implements $MovieResultsCopyWith<$Res> {
  _$MovieResultsCopyWithImpl(this._self, this._then);

  final MovieResults _self;
  final $Res Function(MovieResults) _then;

/// Create a copy of MovieResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backdropPath = freezed,Object? id = null,Object? originalTitle = null,Object? overview = null,Object? posterPath = freezed,Object? mediaType = freezed,Object? adult = null,Object? title = null,Object? originalLanguage = null,Object? genreIds = null,Object? popularity = null,Object? releaseDate = freezed,Object? video = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(MovieResults(
backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,genreIds: null == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieResults].
extension MovieResultsPatterns on MovieResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieResults value)  $default,){
final _that = this;
switch (_that) {
case _MovieResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieResults value)?  $default,){
final _that = this;
switch (_that) {
case _MovieResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'backdrop_path')  String? backdropPath,  int id, @JsonKey(name: 'original_title')  String originalTitle,  String overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'media_type')  String? mediaType,  bool adult,  String title, @JsonKey(name: 'original_language')  String originalLanguage, @JsonKey(name: 'genre_ids')  List<int> genreIds,  double popularity, @JsonKey(name: 'release_date', fromJson: _parseDate)  DateTime? releaseDate,  bool video, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieResults() when $default != null:
return $default(_that.backdropPath,_that.id,_that.originalTitle,_that.overview,_that.posterPath,_that.mediaType,_that.adult,_that.title,_that.originalLanguage,_that.genreIds,_that.popularity,_that.releaseDate,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'backdrop_path')  String? backdropPath,  int id, @JsonKey(name: 'original_title')  String originalTitle,  String overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'media_type')  String? mediaType,  bool adult,  String title, @JsonKey(name: 'original_language')  String originalLanguage, @JsonKey(name: 'genre_ids')  List<int> genreIds,  double popularity, @JsonKey(name: 'release_date', fromJson: _parseDate)  DateTime? releaseDate,  bool video, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount)  $default,) {final _that = this;
switch (_that) {
case _MovieResults():
return $default(_that.backdropPath,_that.id,_that.originalTitle,_that.overview,_that.posterPath,_that.mediaType,_that.adult,_that.title,_that.originalLanguage,_that.genreIds,_that.popularity,_that.releaseDate,_that.video,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'backdrop_path')  String? backdropPath,  int id, @JsonKey(name: 'original_title')  String originalTitle,  String overview, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'media_type')  String? mediaType,  bool adult,  String title, @JsonKey(name: 'original_language')  String originalLanguage, @JsonKey(name: 'genre_ids')  List<int> genreIds,  double popularity, @JsonKey(name: 'release_date', fromJson: _parseDate)  DateTime? releaseDate,  bool video, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount)?  $default,) {final _that = this;
switch (_that) {
case _MovieResults() when $default != null:
return $default(_that.backdropPath,_that.id,_that.originalTitle,_that.overview,_that.posterPath,_that.mediaType,_that.adult,_that.title,_that.originalLanguage,_that.genreIds,_that.popularity,_that.releaseDate,_that.video,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieResults implements MovieResults {
  const _MovieResults({@JsonKey(name: 'backdrop_path') this.backdropPath, required this.id, @JsonKey(name: 'original_title') required this.originalTitle, required this.overview, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'media_type') this.mediaType, required this.adult, required this.title, @JsonKey(name: 'original_language') required this.originalLanguage, @JsonKey(name: 'genre_ids') required  List<int> genreIds, required this.popularity, @JsonKey(name: 'release_date', fromJson: _parseDate) this.releaseDate, required this.video, @JsonKey(name: 'vote_average') required this.voteAverage, @JsonKey(name: 'vote_count') required this.voteCount}): _genreIds = genreIds;
  factory _MovieResults.fromJson(Map<String, dynamic> json) => _$MovieResultsFromJson(json);

@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
@override final  int id;
@override@JsonKey(name: 'original_title') final  String originalTitle;
@override final  String overview;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'media_type') final  String? mediaType;
@override final  bool adult;
@override final  String title;
@override@JsonKey(name: 'original_language') final  String originalLanguage;
 final  List<int> _genreIds;
@override@JsonKey(name: 'genre_ids') List<int> get genreIds {
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genreIds);
}

@override final  double popularity;
@override@JsonKey(name: 'release_date', fromJson: _parseDate) final  DateTime? releaseDate;
@override final  bool video;
@override@JsonKey(name: 'vote_average') final  double voteAverage;
@override@JsonKey(name: 'vote_count') final  int voteCount;

/// Create a copy of MovieResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieResultsCopyWith<_MovieResults> get copyWith => __$MovieResultsCopyWithImpl<_MovieResults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieResultsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieResults&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.id, id) || other.id == id)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&const DeepCollectionEquality().equals(other.genreIds, _genreIds)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.video, video) || other.video == video)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,backdropPath,id,originalTitle,overview,posterPath,mediaType,adult,title,originalLanguage,const DeepCollectionEquality().hash(_genreIds),popularity,releaseDate,video,voteAverage,voteCount);
}

@override
String toString() {
    return 'MovieResults(backdropPath: $backdropPath, id: $id, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, adult: $adult, title: $title, originalLanguage: $originalLanguage, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$MovieResultsCopyWith<$Res> implements $MovieResultsCopyWith<$Res> {
  factory _$MovieResultsCopyWith(_MovieResults value, $Res Function(_MovieResults) _then) = __$MovieResultsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'backdrop_path') String? backdropPath, int id,@JsonKey(name: 'original_title') String originalTitle, String overview,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'media_type') String? mediaType, bool adult, String title,@JsonKey(name: 'original_language') String originalLanguage,@JsonKey(name: 'genre_ids') List<int> genreIds, double popularity,@JsonKey(name: 'release_date', fromJson: _parseDate) DateTime? releaseDate, bool video,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount
});




}
/// @nodoc
class __$MovieResultsCopyWithImpl<$Res>
    implements _$MovieResultsCopyWith<$Res> {
  __$MovieResultsCopyWithImpl(this._self, this._then);

  final _MovieResults _self;
  final $Res Function(_MovieResults) _then;

/// Create a copy of MovieResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backdropPath = freezed,Object? id = null,Object? originalTitle = null,Object? overview = null,Object? posterPath = freezed,Object? mediaType = freezed,Object? adult = null,Object? title = null,Object? originalLanguage = null,Object? genreIds = null,Object? popularity = null,Object? releaseDate = freezed,Object? video = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_MovieResults(
backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,genreIds: null == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as bool,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
