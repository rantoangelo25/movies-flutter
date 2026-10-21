// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenreState {

 Genre get genre; bool get isSelected;
/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreStateCopyWith<GenreState> get copyWith => _$GenreStateCopyWithImpl<GenreState>(this as GenreState, _$identity);

  /// Serializes this GenreState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GenreState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreState&&(identical(other.genre, _this.genre) || other.genre == _this.genre)&&(identical(other.isSelected, _this.isSelected) || other.isSelected == _this.isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GenreState;
  return Object.hash(runtimeType,_this.genre,_this.isSelected);
}

@override
String toString() {
  final _this = this as GenreState;
  return 'GenreState(genre: ${_this.genre}, isSelected: ${_this.isSelected})';
}


}

/// @nodoc
abstract mixin class $GenreStateCopyWith<$Res>  {
  factory $GenreStateCopyWith(GenreState value, $Res Function(GenreState) _then) = _$GenreStateCopyWithImpl;
@useResult
$Res call({
 Genre genre, bool isSelected
});


$GenreCopyWith<$Res> get genre;

}
/// @nodoc
class _$GenreStateCopyWithImpl<$Res>
    implements $GenreStateCopyWith<$Res> {
  _$GenreStateCopyWithImpl(this._self, this._then);

  final GenreState _self;
  final $Res Function(GenreState) _then;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genre = null,Object? isSelected = null,}) {
  return _then(GenreState(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}


/// Adds pattern-matching-related methods to [GenreState].
extension GenreStatePatterns on GenreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenreState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenreState value)  $default,){
final _that = this;
switch (_that) {
case _GenreState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenreState value)?  $default,){
final _that = this;
switch (_that) {
case _GenreState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Genre genre,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenreState() when $default != null:
return $default(_that.genre,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Genre genre,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _GenreState():
return $default(_that.genre,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Genre genre,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _GenreState() when $default != null:
return $default(_that.genre,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenreState implements GenreState {
  const _GenreState({required this.genre, required this.isSelected});
  factory _GenreState.fromJson(Map<String, dynamic> json) => _$GenreStateFromJson(json);

@override final  Genre genre;
@override final  bool isSelected;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreStateCopyWith<_GenreState> get copyWith => __$GenreStateCopyWithImpl<_GenreState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenreStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenreState&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,genre,isSelected);
}

@override
String toString() {
    return 'GenreState(genre: $genre, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$GenreStateCopyWith<$Res> implements $GenreStateCopyWith<$Res> {
  factory _$GenreStateCopyWith(_GenreState value, $Res Function(_GenreState) _then) = __$GenreStateCopyWithImpl;
@override @useResult
$Res call({
 Genre genre, bool isSelected
});


@override $GenreCopyWith<$Res> get genre;

}
/// @nodoc
class __$GenreStateCopyWithImpl<$Res>
    implements _$GenreStateCopyWith<$Res> {
  __$GenreStateCopyWithImpl(this._self, this._then);

  final _GenreState _self;
  final $Res Function(_GenreState) _then;

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genre = null,Object? isSelected = null,}) {
  return _then(_GenreState(
genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as Genre,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GenreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GenreCopyWith<$Res> get genre {
  
  return $GenreCopyWith<$Res>(_self.genre, (value) {
    return _then(_self.copyWith(genre: value));
  });
}
}

// dart format on
