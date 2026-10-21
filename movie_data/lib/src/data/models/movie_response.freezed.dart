// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieResponse {

 int get page; List<MovieResults> get results;@JsonKey(name: 'total_pages') int get totalPages;@JsonKey(name: 'total_results') int get totalResults;
/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieResponseCopyWith<MovieResponse> get copyWith => _$MovieResponseCopyWithImpl<MovieResponse>(this as MovieResponse, _$identity);

  /// Serializes this MovieResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieResponse&&(identical(other.page, _this.page) || other.page == _this.page)&&const DeepCollectionEquality().equals(other.results, _this.results)&&(identical(other.totalPages, _this.totalPages) || other.totalPages == _this.totalPages)&&(identical(other.totalResults, _this.totalResults) || other.totalResults == _this.totalResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieResponse;
  return Object.hash(runtimeType,_this.page,const DeepCollectionEquality().hash(_this.results),_this.totalPages,_this.totalResults);
}

@override
String toString() {
  final _this = this as MovieResponse;
  return 'MovieResponse(page: ${_this.page}, results: ${_this.results}, totalPages: ${_this.totalPages}, totalResults: ${_this.totalResults})';
}


}

/// @nodoc
abstract mixin class $MovieResponseCopyWith<$Res>  {
  factory $MovieResponseCopyWith(MovieResponse value, $Res Function(MovieResponse) _then) = _$MovieResponseCopyWithImpl;
@useResult
$Res call({
 int page, List<MovieResults> results,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'total_results') int totalResults
});




}
/// @nodoc
class _$MovieResponseCopyWithImpl<$Res>
    implements $MovieResponseCopyWith<$Res> {
  _$MovieResponseCopyWithImpl(this._self, this._then);

  final MovieResponse _self;
  final $Res Function(MovieResponse) _then;

/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? results = null,Object? totalPages = null,Object? totalResults = null,}) {
  return _then(MovieResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<MovieResults>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieResponse].
extension MovieResponsePatterns on MovieResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieResponse value)  $default,){
final _that = this;
switch (_that) {
case _MovieResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  List<MovieResults> results, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'total_results')  int totalResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
return $default(_that.page,_that.results,_that.totalPages,_that.totalResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  List<MovieResults> results, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'total_results')  int totalResults)  $default,) {final _that = this;
switch (_that) {
case _MovieResponse():
return $default(_that.page,_that.results,_that.totalPages,_that.totalResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  List<MovieResults> results, @JsonKey(name: 'total_pages')  int totalPages, @JsonKey(name: 'total_results')  int totalResults)?  $default,) {final _that = this;
switch (_that) {
case _MovieResponse() when $default != null:
return $default(_that.page,_that.results,_that.totalPages,_that.totalResults);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieResponse implements MovieResponse {
  const _MovieResponse({required this.page, required  List<MovieResults> results, @JsonKey(name: 'total_pages') required this.totalPages, @JsonKey(name: 'total_results') required this.totalResults}): _results = results;
  factory _MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

@override final  int page;
 final  List<MovieResults> _results;
@override List<MovieResults> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey(name: 'total_pages') final  int totalPages;
@override@JsonKey(name: 'total_results') final  int totalResults;

/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieResponseCopyWith<_MovieResponse> get copyWith => __$MovieResponseCopyWithImpl<_MovieResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieResponse&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.results, _results)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,page,const DeepCollectionEquality().hash(_results),totalPages,totalResults);
}

@override
String toString() {
    return 'MovieResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
}


}

/// @nodoc
abstract mixin class _$MovieResponseCopyWith<$Res> implements $MovieResponseCopyWith<$Res> {
  factory _$MovieResponseCopyWith(_MovieResponse value, $Res Function(_MovieResponse) _then) = __$MovieResponseCopyWithImpl;
@override @useResult
$Res call({
 int page, List<MovieResults> results,@JsonKey(name: 'total_pages') int totalPages,@JsonKey(name: 'total_results') int totalResults
});




}
/// @nodoc
class __$MovieResponseCopyWithImpl<$Res>
    implements _$MovieResponseCopyWith<$Res> {
  __$MovieResponseCopyWithImpl(this._self, this._then);

  final _MovieResponse _self;
  final $Res Function(_MovieResponse) _then;

/// Create a copy of MovieResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? results = null,Object? totalPages = null,Object? totalResults = null,}) {
  return _then(_MovieResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<MovieResults>,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
