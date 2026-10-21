// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieConfiguration {

@JsonKey(name: 'images') MovieConfigurationImages get images;@JsonKey(name: 'change_keys') List<String> get changeKeys;
/// Create a copy of MovieConfiguration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieConfigurationCopyWith<MovieConfiguration> get copyWith => _$MovieConfigurationCopyWithImpl<MovieConfiguration>(this as MovieConfiguration, _$identity);

  /// Serializes this MovieConfiguration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieConfiguration;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieConfiguration&&(identical(other.images, _this.images) || other.images == _this.images)&&const DeepCollectionEquality().equals(other.changeKeys, _this.changeKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieConfiguration;
  return Object.hash(runtimeType,_this.images,const DeepCollectionEquality().hash(_this.changeKeys));
}

@override
String toString() {
  final _this = this as MovieConfiguration;
  return 'MovieConfiguration(images: ${_this.images}, changeKeys: ${_this.changeKeys})';
}


}

/// @nodoc
abstract mixin class $MovieConfigurationCopyWith<$Res>  {
  factory $MovieConfigurationCopyWith(MovieConfiguration value, $Res Function(MovieConfiguration) _then) = _$MovieConfigurationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'images') MovieConfigurationImages images,@JsonKey(name: 'change_keys') List<String> changeKeys
});


$MovieConfigurationImagesCopyWith<$Res> get images;

}
/// @nodoc
class _$MovieConfigurationCopyWithImpl<$Res>
    implements $MovieConfigurationCopyWith<$Res> {
  _$MovieConfigurationCopyWithImpl(this._self, this._then);

  final MovieConfiguration _self;
  final $Res Function(MovieConfiguration) _then;

/// Create a copy of MovieConfiguration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,Object? changeKeys = null,}) {
  return _then(MovieConfiguration(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as MovieConfigurationImages,changeKeys: null == changeKeys ? _self.changeKeys : changeKeys // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of MovieConfiguration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieConfigurationImagesCopyWith<$Res> get images {
  
  return $MovieConfigurationImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieConfiguration].
extension MovieConfigurationPatterns on MovieConfiguration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieConfiguration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieConfiguration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieConfiguration value)  $default,){
final _that = this;
switch (_that) {
case _MovieConfiguration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieConfiguration value)?  $default,){
final _that = this;
switch (_that) {
case _MovieConfiguration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'images')  MovieConfigurationImages images, @JsonKey(name: 'change_keys')  List<String> changeKeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieConfiguration() when $default != null:
return $default(_that.images,_that.changeKeys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'images')  MovieConfigurationImages images, @JsonKey(name: 'change_keys')  List<String> changeKeys)  $default,) {final _that = this;
switch (_that) {
case _MovieConfiguration():
return $default(_that.images,_that.changeKeys);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'images')  MovieConfigurationImages images, @JsonKey(name: 'change_keys')  List<String> changeKeys)?  $default,) {final _that = this;
switch (_that) {
case _MovieConfiguration() when $default != null:
return $default(_that.images,_that.changeKeys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieConfiguration implements MovieConfiguration {
  const _MovieConfiguration({@JsonKey(name: 'images') required this.images, @JsonKey(name: 'change_keys') required  List<String> changeKeys}): _changeKeys = changeKeys;
  factory _MovieConfiguration.fromJson(Map<String, dynamic> json) => _$MovieConfigurationFromJson(json);

@override@JsonKey(name: 'images') final  MovieConfigurationImages images;
 final  List<String> _changeKeys;
@override@JsonKey(name: 'change_keys') List<String> get changeKeys {
  if (_changeKeys is EqualUnmodifiableListView) return _changeKeys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_changeKeys);
}


/// Create a copy of MovieConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieConfigurationCopyWith<_MovieConfiguration> get copyWith => __$MovieConfigurationCopyWithImpl<_MovieConfiguration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieConfigurationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieConfiguration&&(identical(other.images, images) || other.images == images)&&const DeepCollectionEquality().equals(other.changeKeys, _changeKeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,images,const DeepCollectionEquality().hash(_changeKeys));
}

@override
String toString() {
    return 'MovieConfiguration(images: $images, changeKeys: $changeKeys)';
}


}

/// @nodoc
abstract mixin class _$MovieConfigurationCopyWith<$Res> implements $MovieConfigurationCopyWith<$Res> {
  factory _$MovieConfigurationCopyWith(_MovieConfiguration value, $Res Function(_MovieConfiguration) _then) = __$MovieConfigurationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'images') MovieConfigurationImages images,@JsonKey(name: 'change_keys') List<String> changeKeys
});


@override $MovieConfigurationImagesCopyWith<$Res> get images;

}
/// @nodoc
class __$MovieConfigurationCopyWithImpl<$Res>
    implements _$MovieConfigurationCopyWith<$Res> {
  __$MovieConfigurationCopyWithImpl(this._self, this._then);

  final _MovieConfiguration _self;
  final $Res Function(_MovieConfiguration) _then;

/// Create a copy of MovieConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,Object? changeKeys = null,}) {
  return _then(_MovieConfiguration(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as MovieConfigurationImages,changeKeys: null == changeKeys ? _self._changeKeys : changeKeys // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of MovieConfiguration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MovieConfigurationImagesCopyWith<$Res> get images {
  
  return $MovieConfigurationImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// @nodoc
mixin _$MovieConfigurationImages {

@JsonKey(name: 'base_url') String get baseUrl;@JsonKey(name: 'secure_base_url') String get secureBaseUrl;@JsonKey(name: 'backdrop_sizes') List<String> get backdropSizes;@JsonKey(name: 'logo_sizes') List<String> get logoSizes;@JsonKey(name: 'poster_sizes') List<String> get posterSizes;@JsonKey(name: 'profile_sizes') List<String> get profileSizes;@JsonKey(name: 'still_sizes') List<String> get stillSizes;
/// Create a copy of MovieConfigurationImages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieConfigurationImagesCopyWith<MovieConfigurationImages> get copyWith => _$MovieConfigurationImagesCopyWithImpl<MovieConfigurationImages>(this as MovieConfigurationImages, _$identity);

  /// Serializes this MovieConfigurationImages to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MovieConfigurationImages;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieConfigurationImages&&(identical(other.baseUrl, _this.baseUrl) || other.baseUrl == _this.baseUrl)&&(identical(other.secureBaseUrl, _this.secureBaseUrl) || other.secureBaseUrl == _this.secureBaseUrl)&&const DeepCollectionEquality().equals(other.backdropSizes, _this.backdropSizes)&&const DeepCollectionEquality().equals(other.logoSizes, _this.logoSizes)&&const DeepCollectionEquality().equals(other.posterSizes, _this.posterSizes)&&const DeepCollectionEquality().equals(other.profileSizes, _this.profileSizes)&&const DeepCollectionEquality().equals(other.stillSizes, _this.stillSizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MovieConfigurationImages;
  return Object.hash(runtimeType,_this.baseUrl,_this.secureBaseUrl,const DeepCollectionEquality().hash(_this.backdropSizes),const DeepCollectionEquality().hash(_this.logoSizes),const DeepCollectionEquality().hash(_this.posterSizes),const DeepCollectionEquality().hash(_this.profileSizes),const DeepCollectionEquality().hash(_this.stillSizes));
}

@override
String toString() {
  final _this = this as MovieConfigurationImages;
  return 'MovieConfigurationImages(baseUrl: ${_this.baseUrl}, secureBaseUrl: ${_this.secureBaseUrl}, backdropSizes: ${_this.backdropSizes}, logoSizes: ${_this.logoSizes}, posterSizes: ${_this.posterSizes}, profileSizes: ${_this.profileSizes}, stillSizes: ${_this.stillSizes})';
}


}

/// @nodoc
abstract mixin class $MovieConfigurationImagesCopyWith<$Res>  {
  factory $MovieConfigurationImagesCopyWith(MovieConfigurationImages value, $Res Function(MovieConfigurationImages) _then) = _$MovieConfigurationImagesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'base_url') String baseUrl,@JsonKey(name: 'secure_base_url') String secureBaseUrl,@JsonKey(name: 'backdrop_sizes') List<String> backdropSizes,@JsonKey(name: 'logo_sizes') List<String> logoSizes,@JsonKey(name: 'poster_sizes') List<String> posterSizes,@JsonKey(name: 'profile_sizes') List<String> profileSizes,@JsonKey(name: 'still_sizes') List<String> stillSizes
});




}
/// @nodoc
class _$MovieConfigurationImagesCopyWithImpl<$Res>
    implements $MovieConfigurationImagesCopyWith<$Res> {
  _$MovieConfigurationImagesCopyWithImpl(this._self, this._then);

  final MovieConfigurationImages _self;
  final $Res Function(MovieConfigurationImages) _then;

/// Create a copy of MovieConfigurationImages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = null,Object? secureBaseUrl = null,Object? backdropSizes = null,Object? logoSizes = null,Object? posterSizes = null,Object? profileSizes = null,Object? stillSizes = null,}) {
  return _then(MovieConfigurationImages(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,secureBaseUrl: null == secureBaseUrl ? _self.secureBaseUrl : secureBaseUrl // ignore: cast_nullable_to_non_nullable
as String,backdropSizes: null == backdropSizes ? _self.backdropSizes : backdropSizes // ignore: cast_nullable_to_non_nullable
as List<String>,logoSizes: null == logoSizes ? _self.logoSizes : logoSizes // ignore: cast_nullable_to_non_nullable
as List<String>,posterSizes: null == posterSizes ? _self.posterSizes : posterSizes // ignore: cast_nullable_to_non_nullable
as List<String>,profileSizes: null == profileSizes ? _self.profileSizes : profileSizes // ignore: cast_nullable_to_non_nullable
as List<String>,stillSizes: null == stillSizes ? _self.stillSizes : stillSizes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieConfigurationImages].
extension MovieConfigurationImagesPatterns on MovieConfigurationImages {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieConfigurationImages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieConfigurationImages() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieConfigurationImages value)  $default,){
final _that = this;
switch (_that) {
case _MovieConfigurationImages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieConfigurationImages value)?  $default,){
final _that = this;
switch (_that) {
case _MovieConfigurationImages() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'base_url')  String baseUrl, @JsonKey(name: 'secure_base_url')  String secureBaseUrl, @JsonKey(name: 'backdrop_sizes')  List<String> backdropSizes, @JsonKey(name: 'logo_sizes')  List<String> logoSizes, @JsonKey(name: 'poster_sizes')  List<String> posterSizes, @JsonKey(name: 'profile_sizes')  List<String> profileSizes, @JsonKey(name: 'still_sizes')  List<String> stillSizes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieConfigurationImages() when $default != null:
return $default(_that.baseUrl,_that.secureBaseUrl,_that.backdropSizes,_that.logoSizes,_that.posterSizes,_that.profileSizes,_that.stillSizes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'base_url')  String baseUrl, @JsonKey(name: 'secure_base_url')  String secureBaseUrl, @JsonKey(name: 'backdrop_sizes')  List<String> backdropSizes, @JsonKey(name: 'logo_sizes')  List<String> logoSizes, @JsonKey(name: 'poster_sizes')  List<String> posterSizes, @JsonKey(name: 'profile_sizes')  List<String> profileSizes, @JsonKey(name: 'still_sizes')  List<String> stillSizes)  $default,) {final _that = this;
switch (_that) {
case _MovieConfigurationImages():
return $default(_that.baseUrl,_that.secureBaseUrl,_that.backdropSizes,_that.logoSizes,_that.posterSizes,_that.profileSizes,_that.stillSizes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'base_url')  String baseUrl, @JsonKey(name: 'secure_base_url')  String secureBaseUrl, @JsonKey(name: 'backdrop_sizes')  List<String> backdropSizes, @JsonKey(name: 'logo_sizes')  List<String> logoSizes, @JsonKey(name: 'poster_sizes')  List<String> posterSizes, @JsonKey(name: 'profile_sizes')  List<String> profileSizes, @JsonKey(name: 'still_sizes')  List<String> stillSizes)?  $default,) {final _that = this;
switch (_that) {
case _MovieConfigurationImages() when $default != null:
return $default(_that.baseUrl,_that.secureBaseUrl,_that.backdropSizes,_that.logoSizes,_that.posterSizes,_that.profileSizes,_that.stillSizes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieConfigurationImages implements MovieConfigurationImages {
  const _MovieConfigurationImages({@JsonKey(name: 'base_url') required this.baseUrl, @JsonKey(name: 'secure_base_url') required this.secureBaseUrl, @JsonKey(name: 'backdrop_sizes') required  List<String> backdropSizes, @JsonKey(name: 'logo_sizes') required  List<String> logoSizes, @JsonKey(name: 'poster_sizes') required  List<String> posterSizes, @JsonKey(name: 'profile_sizes') required  List<String> profileSizes, @JsonKey(name: 'still_sizes') required  List<String> stillSizes}): _backdropSizes = backdropSizes,_logoSizes = logoSizes,_posterSizes = posterSizes,_profileSizes = profileSizes,_stillSizes = stillSizes;
  factory _MovieConfigurationImages.fromJson(Map<String, dynamic> json) => _$MovieConfigurationImagesFromJson(json);

@override@JsonKey(name: 'base_url') final  String baseUrl;
@override@JsonKey(name: 'secure_base_url') final  String secureBaseUrl;
 final  List<String> _backdropSizes;
@override@JsonKey(name: 'backdrop_sizes') List<String> get backdropSizes {
  if (_backdropSizes is EqualUnmodifiableListView) return _backdropSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_backdropSizes);
}

 final  List<String> _logoSizes;
@override@JsonKey(name: 'logo_sizes') List<String> get logoSizes {
  if (_logoSizes is EqualUnmodifiableListView) return _logoSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logoSizes);
}

 final  List<String> _posterSizes;
@override@JsonKey(name: 'poster_sizes') List<String> get posterSizes {
  if (_posterSizes is EqualUnmodifiableListView) return _posterSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posterSizes);
}

 final  List<String> _profileSizes;
@override@JsonKey(name: 'profile_sizes') List<String> get profileSizes {
  if (_profileSizes is EqualUnmodifiableListView) return _profileSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profileSizes);
}

 final  List<String> _stillSizes;
@override@JsonKey(name: 'still_sizes') List<String> get stillSizes {
  if (_stillSizes is EqualUnmodifiableListView) return _stillSizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stillSizes);
}


/// Create a copy of MovieConfigurationImages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieConfigurationImagesCopyWith<_MovieConfigurationImages> get copyWith => __$MovieConfigurationImagesCopyWithImpl<_MovieConfigurationImages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieConfigurationImagesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieConfigurationImages&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.secureBaseUrl, secureBaseUrl) || other.secureBaseUrl == secureBaseUrl)&&const DeepCollectionEquality().equals(other.backdropSizes, _backdropSizes)&&const DeepCollectionEquality().equals(other.logoSizes, _logoSizes)&&const DeepCollectionEquality().equals(other.posterSizes, _posterSizes)&&const DeepCollectionEquality().equals(other.profileSizes, _profileSizes)&&const DeepCollectionEquality().equals(other.stillSizes, _stillSizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,baseUrl,secureBaseUrl,const DeepCollectionEquality().hash(_backdropSizes),const DeepCollectionEquality().hash(_logoSizes),const DeepCollectionEquality().hash(_posterSizes),const DeepCollectionEquality().hash(_profileSizes),const DeepCollectionEquality().hash(_stillSizes));
}

@override
String toString() {
    return 'MovieConfigurationImages(baseUrl: $baseUrl, secureBaseUrl: $secureBaseUrl, backdropSizes: $backdropSizes, logoSizes: $logoSizes, posterSizes: $posterSizes, profileSizes: $profileSizes, stillSizes: $stillSizes)';
}


}

/// @nodoc
abstract mixin class _$MovieConfigurationImagesCopyWith<$Res> implements $MovieConfigurationImagesCopyWith<$Res> {
  factory _$MovieConfigurationImagesCopyWith(_MovieConfigurationImages value, $Res Function(_MovieConfigurationImages) _then) = __$MovieConfigurationImagesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'base_url') String baseUrl,@JsonKey(name: 'secure_base_url') String secureBaseUrl,@JsonKey(name: 'backdrop_sizes') List<String> backdropSizes,@JsonKey(name: 'logo_sizes') List<String> logoSizes,@JsonKey(name: 'poster_sizes') List<String> posterSizes,@JsonKey(name: 'profile_sizes') List<String> profileSizes,@JsonKey(name: 'still_sizes') List<String> stillSizes
});




}
/// @nodoc
class __$MovieConfigurationImagesCopyWithImpl<$Res>
    implements _$MovieConfigurationImagesCopyWith<$Res> {
  __$MovieConfigurationImagesCopyWithImpl(this._self, this._then);

  final _MovieConfigurationImages _self;
  final $Res Function(_MovieConfigurationImages) _then;

/// Create a copy of MovieConfigurationImages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = null,Object? secureBaseUrl = null,Object? backdropSizes = null,Object? logoSizes = null,Object? posterSizes = null,Object? profileSizes = null,Object? stillSizes = null,}) {
  return _then(_MovieConfigurationImages(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,secureBaseUrl: null == secureBaseUrl ? _self.secureBaseUrl : secureBaseUrl // ignore: cast_nullable_to_non_nullable
as String,backdropSizes: null == backdropSizes ? _self._backdropSizes : backdropSizes // ignore: cast_nullable_to_non_nullable
as List<String>,logoSizes: null == logoSizes ? _self._logoSizes : logoSizes // ignore: cast_nullable_to_non_nullable
as List<String>,posterSizes: null == posterSizes ? _self._posterSizes : posterSizes // ignore: cast_nullable_to_non_nullable
as List<String>,profileSizes: null == profileSizes ? _self._profileSizes : profileSizes // ignore: cast_nullable_to_non_nullable
as List<String>,stillSizes: null == stillSizes ? _self._stillSizes : stillSizes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
