// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_credits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieCredits {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'cast') List<MovieCast> get cast;@JsonKey(name: 'crew') List<MovieCast> get crew;
/// Create a copy of MovieCredits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCreditsCopyWith<MovieCredits> get copyWith => _$MovieCreditsCopyWithImpl<MovieCredits>(this as MovieCredits, _$identity);

  /// Serializes this MovieCredits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieCredits;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCredits&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.cast, _this.cast)&&const DeepCollectionEquality().equals(other.crew, _this.crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieCredits;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.cast),const DeepCollectionEquality().hash(_this.crew));
}

@override
String toString() {
  final _this = this as MovieCredits;
  return 'MovieCredits(id: ${_this.id}, cast: ${_this.cast}, crew: ${_this.crew})';
}


}

/// @nodoc
abstract mixin class $MovieCreditsCopyWith<$Res>  {
  factory $MovieCreditsCopyWith(MovieCredits value, $Res Function(MovieCredits) _then) = _$MovieCreditsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'cast') List<MovieCast> cast,@JsonKey(name: 'crew') List<MovieCast> crew
});




}
/// @nodoc
class _$MovieCreditsCopyWithImpl<$Res>
    implements $MovieCreditsCopyWith<$Res> {
  _$MovieCreditsCopyWithImpl(this._self, this._then);

  final MovieCredits _self;
  final $Res Function(MovieCredits) _then;

/// Create a copy of MovieCredits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cast = null,Object? crew = null,}) {
  return _then(MovieCredits(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cast: null == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as List<MovieCast>,crew: null == crew ? _self.crew : crew // ignore: cast_nullable_to_non_nullable
as List<MovieCast>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCredits].
extension MovieCreditsPatterns on MovieCredits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCredits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCredits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCredits value)  $default,){
final _that = this;
switch (_that) {
case _MovieCredits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCredits value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCredits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'cast')  List<MovieCast> cast, @JsonKey(name: 'crew')  List<MovieCast> crew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCredits() when $default != null:
return $default(_that.id,_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'cast')  List<MovieCast> cast, @JsonKey(name: 'crew')  List<MovieCast> crew)  $default,) {final _that = this;
switch (_that) {
case _MovieCredits():
return $default(_that.id,_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'cast')  List<MovieCast> cast, @JsonKey(name: 'crew')  List<MovieCast> crew)?  $default,) {final _that = this;
switch (_that) {
case _MovieCredits() when $default != null:
return $default(_that.id,_that.cast,_that.crew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCredits implements MovieCredits {
  const _MovieCredits({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'cast') required  List<MovieCast> cast, @JsonKey(name: 'crew') required  List<MovieCast> crew}): _cast = cast,_crew = crew;
  factory _MovieCredits.fromJson(Map<String, dynamic> json) => _$MovieCreditsFromJson(json);

@override@JsonKey(name: 'id') final  int id;
 final  List<MovieCast> _cast;
@override@JsonKey(name: 'cast') List<MovieCast> get cast {
  if (_cast is EqualUnmodifiableListView) return _cast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cast);
}

 final  List<MovieCast> _crew;
@override@JsonKey(name: 'crew') List<MovieCast> get crew {
  if (_crew is EqualUnmodifiableListView) return _crew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crew);
}


/// Create a copy of MovieCredits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCreditsCopyWith<_MovieCredits> get copyWith => __$MovieCreditsCopyWithImpl<_MovieCredits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCreditsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCredits&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.cast, _cast)&&const DeepCollectionEquality().equals(other.crew, _crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_cast),const DeepCollectionEquality().hash(_crew));
}

@override
String toString() {
    return 'MovieCredits(id: $id, cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class _$MovieCreditsCopyWith<$Res> implements $MovieCreditsCopyWith<$Res> {
  factory _$MovieCreditsCopyWith(_MovieCredits value, $Res Function(_MovieCredits) _then) = __$MovieCreditsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'cast') List<MovieCast> cast,@JsonKey(name: 'crew') List<MovieCast> crew
});




}
/// @nodoc
class __$MovieCreditsCopyWithImpl<$Res>
    implements _$MovieCreditsCopyWith<$Res> {
  __$MovieCreditsCopyWithImpl(this._self, this._then);

  final _MovieCredits _self;
  final $Res Function(_MovieCredits) _then;

/// Create a copy of MovieCredits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cast = null,Object? crew = null,}) {
  return _then(_MovieCredits(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cast: null == cast ? _self._cast : cast // ignore: cast_nullable_to_non_nullable
as List<MovieCast>,crew: null == crew ? _self._crew : crew // ignore: cast_nullable_to_non_nullable
as List<MovieCast>,
  ));
}


}


/// @nodoc
mixin _$MovieCast {

@JsonKey(name: 'adult') bool get adult;@JsonKey(name: 'gender') int get gender;@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'original_name') String get originalName;@JsonKey(name: 'popularity') double get popularity;@JsonKey(name: 'profile_path') String? get profilePath;@JsonKey(name: 'cast_id') int? get castId;@JsonKey(name: 'character') String? get character;@JsonKey(name: 'credit_id') String get creditId;@JsonKey(name: 'order') int? get order;@JsonKey(name: 'job') String? get job;
/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCastCopyWith<MovieCast> get copyWith => _$MovieCastCopyWithImpl<MovieCast>(this as MovieCast, _$identity);

  /// Serializes this MovieCast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieCast;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCast&&(identical(other.adult, _this.adult) || other.adult == _this.adult)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.originalName, _this.originalName) || other.originalName == _this.originalName)&&(identical(other.popularity, _this.popularity) || other.popularity == _this.popularity)&&(identical(other.profilePath, _this.profilePath) || other.profilePath == _this.profilePath)&&(identical(other.castId, _this.castId) || other.castId == _this.castId)&&(identical(other.character, _this.character) || other.character == _this.character)&&(identical(other.creditId, _this.creditId) || other.creditId == _this.creditId)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.job, _this.job) || other.job == _this.job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieCast;
  return Object.hash(runtimeType,_this.adult,_this.gender,_this.id,_this.name,_this.originalName,_this.popularity,_this.profilePath,_this.castId,_this.character,_this.creditId,_this.order,_this.job);
}

@override
String toString() {
  final _this = this as MovieCast;
  return 'MovieCast(adult: ${_this.adult}, gender: ${_this.gender}, id: ${_this.id}, name: ${_this.name}, originalName: ${_this.originalName}, popularity: ${_this.popularity}, profilePath: ${_this.profilePath}, castId: ${_this.castId}, character: ${_this.character}, creditId: ${_this.creditId}, order: ${_this.order}, job: ${_this.job})';
}


}

/// @nodoc
abstract mixin class $MovieCastCopyWith<$Res>  {
  factory $MovieCastCopyWith(MovieCast value, $Res Function(MovieCast) _then) = _$MovieCastCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'adult') bool adult,@JsonKey(name: 'gender') int gender,@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'original_name') String originalName,@JsonKey(name: 'popularity') double popularity,@JsonKey(name: 'profile_path') String? profilePath,@JsonKey(name: 'cast_id') int? castId,@JsonKey(name: 'character') String? character,@JsonKey(name: 'credit_id') String creditId,@JsonKey(name: 'order') int? order,@JsonKey(name: 'job') String? job
});




}
/// @nodoc
class _$MovieCastCopyWithImpl<$Res>
    implements $MovieCastCopyWith<$Res> {
  _$MovieCastCopyWithImpl(this._self, this._then);

  final MovieCast _self;
  final $Res Function(MovieCast) _then;

/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? name = null,Object? originalName = null,Object? popularity = null,Object? profilePath = freezed,Object? castId = freezed,Object? character = freezed,Object? creditId = null,Object? order = freezed,Object? job = freezed,}) {
  return _then(MovieCast(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,castId: freezed == castId ? _self.castId : castId // ignore: cast_nullable_to_non_nullable
as int?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,creditId: null == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCast].
extension MovieCastPatterns on MovieCast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCast value)  $default,){
final _that = this;
switch (_that) {
case _MovieCast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCast value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'gender')  int gender, @JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'original_name')  String originalName, @JsonKey(name: 'popularity')  double popularity, @JsonKey(name: 'profile_path')  String? profilePath, @JsonKey(name: 'cast_id')  int? castId, @JsonKey(name: 'character')  String? character, @JsonKey(name: 'credit_id')  String creditId, @JsonKey(name: 'order')  int? order, @JsonKey(name: 'job')  String? job)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order,_that.job);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'gender')  int gender, @JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'original_name')  String originalName, @JsonKey(name: 'popularity')  double popularity, @JsonKey(name: 'profile_path')  String? profilePath, @JsonKey(name: 'cast_id')  int? castId, @JsonKey(name: 'character')  String? character, @JsonKey(name: 'credit_id')  String creditId, @JsonKey(name: 'order')  int? order, @JsonKey(name: 'job')  String? job)  $default,) {final _that = this;
switch (_that) {
case _MovieCast():
return $default(_that.adult,_that.gender,_that.id,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order,_that.job);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'adult')  bool adult, @JsonKey(name: 'gender')  int gender, @JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'original_name')  String originalName, @JsonKey(name: 'popularity')  double popularity, @JsonKey(name: 'profile_path')  String? profilePath, @JsonKey(name: 'cast_id')  int? castId, @JsonKey(name: 'character')  String? character, @JsonKey(name: 'credit_id')  String creditId, @JsonKey(name: 'order')  int? order, @JsonKey(name: 'job')  String? job)?  $default,) {final _that = this;
switch (_that) {
case _MovieCast() when $default != null:
return $default(_that.adult,_that.gender,_that.id,_that.name,_that.originalName,_that.popularity,_that.profilePath,_that.castId,_that.character,_that.creditId,_that.order,_that.job);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCast implements MovieCast {
  const _MovieCast({@JsonKey(name: 'adult') required this.adult, @JsonKey(name: 'gender') required this.gender, @JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'original_name') required this.originalName, @JsonKey(name: 'popularity') required this.popularity, @JsonKey(name: 'profile_path') required this.profilePath, @JsonKey(name: 'cast_id') this.castId, @JsonKey(name: 'character') this.character, @JsonKey(name: 'credit_id') required this.creditId, @JsonKey(name: 'order') this.order, @JsonKey(name: 'job') this.job});
  factory _MovieCast.fromJson(Map<String, dynamic> json) => _$MovieCastFromJson(json);

@override@JsonKey(name: 'adult') final  bool adult;
@override@JsonKey(name: 'gender') final  int gender;
@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'original_name') final  String originalName;
@override@JsonKey(name: 'popularity') final  double popularity;
@override@JsonKey(name: 'profile_path') final  String? profilePath;
@override@JsonKey(name: 'cast_id') final  int? castId;
@override@JsonKey(name: 'character') final  String? character;
@override@JsonKey(name: 'credit_id') final  String creditId;
@override@JsonKey(name: 'order') final  int? order;
@override@JsonKey(name: 'job') final  String? job;

/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCastCopyWith<_MovieCast> get copyWith => __$MovieCastCopyWithImpl<_MovieCast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCastToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCast&&(identical(other.adult, adult) || other.adult == adult)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.castId, castId) || other.castId == castId)&&(identical(other.character, character) || other.character == character)&&(identical(other.creditId, creditId) || other.creditId == creditId)&&(identical(other.order, order) || other.order == order)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,adult,gender,id,name,originalName,popularity,profilePath,castId,character,creditId,order,job);
}

@override
String toString() {
    return 'MovieCast(adult: $adult, gender: $gender, id: $id, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order, job: $job)';
}


}

/// @nodoc
abstract mixin class _$MovieCastCopyWith<$Res> implements $MovieCastCopyWith<$Res> {
  factory _$MovieCastCopyWith(_MovieCast value, $Res Function(_MovieCast) _then) = __$MovieCastCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'adult') bool adult,@JsonKey(name: 'gender') int gender,@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'original_name') String originalName,@JsonKey(name: 'popularity') double popularity,@JsonKey(name: 'profile_path') String? profilePath,@JsonKey(name: 'cast_id') int? castId,@JsonKey(name: 'character') String? character,@JsonKey(name: 'credit_id') String creditId,@JsonKey(name: 'order') int? order,@JsonKey(name: 'job') String? job
});




}
/// @nodoc
class __$MovieCastCopyWithImpl<$Res>
    implements _$MovieCastCopyWith<$Res> {
  __$MovieCastCopyWithImpl(this._self, this._then);

  final _MovieCast _self;
  final $Res Function(_MovieCast) _then;

/// Create a copy of MovieCast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adult = null,Object? gender = null,Object? id = null,Object? name = null,Object? originalName = null,Object? popularity = null,Object? profilePath = freezed,Object? castId = freezed,Object? character = freezed,Object? creditId = null,Object? order = freezed,Object? job = freezed,}) {
  return _then(_MovieCast(
adult: null == adult ? _self.adult : adult // ignore: cast_nullable_to_non_nullable
as bool,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,castId: freezed == castId ? _self.castId : castId // ignore: cast_nullable_to_non_nullable
as int?,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,creditId: null == creditId ? _self.creditId : creditId // ignore: cast_nullable_to_non_nullable
as String,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
