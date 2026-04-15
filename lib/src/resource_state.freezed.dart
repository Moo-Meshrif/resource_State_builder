// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Resource<T,E> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resource<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T, $E>()';
}


}

/// @nodoc
class $ResourceCopyWith<T,E,$Res>  {
$ResourceCopyWith(Resource<T, E> _, $Res Function(Resource<T, E>) __);
}


/// Adds pattern-matching-related methods to [Resource].
extension ResourcePatterns<T,E> on Resource<T, E> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResourceInitial<T, E> value)?  initial,TResult Function( ResourceLoading<T, E> value)?  loading,TResult Function( ResourcePopUpLoading<T, E> value)?  popUpLoading,TResult Function( ResourceRedirectLoading<T, E> value)?  redirectLoading,TResult Function( ResourceUpdating<T, E> value)?  updating,TResult Function( ResourceGettingMore<T, E> value)?  gettingMore,TResult Function( ResourceLoaded<T, E> value)?  loaded,TResult Function( ResourceError<T, E> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResourceInitial() when initial != null:
return initial(_that);case ResourceLoading() when loading != null:
return loading(_that);case ResourcePopUpLoading() when popUpLoading != null:
return popUpLoading(_that);case ResourceRedirectLoading() when redirectLoading != null:
return redirectLoading(_that);case ResourceUpdating() when updating != null:
return updating(_that);case ResourceGettingMore() when gettingMore != null:
return gettingMore(_that);case ResourceLoaded() when loaded != null:
return loaded(_that);case ResourceError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResourceInitial<T, E> value)  initial,required TResult Function( ResourceLoading<T, E> value)  loading,required TResult Function( ResourcePopUpLoading<T, E> value)  popUpLoading,required TResult Function( ResourceRedirectLoading<T, E> value)  redirectLoading,required TResult Function( ResourceUpdating<T, E> value)  updating,required TResult Function( ResourceGettingMore<T, E> value)  gettingMore,required TResult Function( ResourceLoaded<T, E> value)  loaded,required TResult Function( ResourceError<T, E> value)  error,}){
final _that = this;
switch (_that) {
case ResourceInitial():
return initial(_that);case ResourceLoading():
return loading(_that);case ResourcePopUpLoading():
return popUpLoading(_that);case ResourceRedirectLoading():
return redirectLoading(_that);case ResourceUpdating():
return updating(_that);case ResourceGettingMore():
return gettingMore(_that);case ResourceLoaded():
return loaded(_that);case ResourceError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResourceInitial<T, E> value)?  initial,TResult? Function( ResourceLoading<T, E> value)?  loading,TResult? Function( ResourcePopUpLoading<T, E> value)?  popUpLoading,TResult? Function( ResourceRedirectLoading<T, E> value)?  redirectLoading,TResult? Function( ResourceUpdating<T, E> value)?  updating,TResult? Function( ResourceGettingMore<T, E> value)?  gettingMore,TResult? Function( ResourceLoaded<T, E> value)?  loaded,TResult? Function( ResourceError<T, E> value)?  error,}){
final _that = this;
switch (_that) {
case ResourceInitial() when initial != null:
return initial(_that);case ResourceLoading() when loading != null:
return loading(_that);case ResourcePopUpLoading() when popUpLoading != null:
return popUpLoading(_that);case ResourceRedirectLoading() when redirectLoading != null:
return redirectLoading(_that);case ResourceUpdating() when updating != null:
return updating(_that);case ResourceGettingMore() when gettingMore != null:
return gettingMore(_that);case ResourceLoaded() when loaded != null:
return loaded(_that);case ResourceError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  popUpLoading,TResult Function()?  redirectLoading,TResult Function( T? data)?  updating,TResult Function( T? data)?  gettingMore,TResult Function( T data,  String? message)?  loaded,TResult Function( E error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResourceInitial() when initial != null:
return initial();case ResourceLoading() when loading != null:
return loading();case ResourcePopUpLoading() when popUpLoading != null:
return popUpLoading();case ResourceRedirectLoading() when redirectLoading != null:
return redirectLoading();case ResourceUpdating() when updating != null:
return updating(_that.data);case ResourceGettingMore() when gettingMore != null:
return gettingMore(_that.data);case ResourceLoaded() when loaded != null:
return loaded(_that.data,_that.message);case ResourceError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  popUpLoading,required TResult Function()  redirectLoading,required TResult Function( T? data)  updating,required TResult Function( T? data)  gettingMore,required TResult Function( T data,  String? message)  loaded,required TResult Function( E error)  error,}) {final _that = this;
switch (_that) {
case ResourceInitial():
return initial();case ResourceLoading():
return loading();case ResourcePopUpLoading():
return popUpLoading();case ResourceRedirectLoading():
return redirectLoading();case ResourceUpdating():
return updating(_that.data);case ResourceGettingMore():
return gettingMore(_that.data);case ResourceLoaded():
return loaded(_that.data,_that.message);case ResourceError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  popUpLoading,TResult? Function()?  redirectLoading,TResult? Function( T? data)?  updating,TResult? Function( T? data)?  gettingMore,TResult? Function( T data,  String? message)?  loaded,TResult? Function( E error)?  error,}) {final _that = this;
switch (_that) {
case ResourceInitial() when initial != null:
return initial();case ResourceLoading() when loading != null:
return loading();case ResourcePopUpLoading() when popUpLoading != null:
return popUpLoading();case ResourceRedirectLoading() when redirectLoading != null:
return redirectLoading();case ResourceUpdating() when updating != null:
return updating(_that.data);case ResourceGettingMore() when gettingMore != null:
return gettingMore(_that.data);case ResourceLoaded() when loaded != null:
return loaded(_that.data,_that.message);case ResourceError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ResourceInitial<T,E> extends Resource<T, E> {
  const ResourceInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceInitial<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T, $E>.initial()';
}


}




/// @nodoc


class ResourceLoading<T,E> extends Resource<T, E> {
  const ResourceLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceLoading<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T, $E>.loading()';
}


}




/// @nodoc


class ResourcePopUpLoading<T,E> extends Resource<T, E> {
  const ResourcePopUpLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourcePopUpLoading<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T, $E>.popUpLoading()';
}


}




/// @nodoc


class ResourceRedirectLoading<T,E> extends Resource<T, E> {
  const ResourceRedirectLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceRedirectLoading<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Resource<$T, $E>.redirectLoading()';
}


}




/// @nodoc


class ResourceUpdating<T,E> extends Resource<T, E> {
  const ResourceUpdating(this.data): super._();
  

 final  T? data;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceUpdatingCopyWith<T, E, ResourceUpdating<T, E>> get copyWith => _$ResourceUpdatingCopyWithImpl<T, E, ResourceUpdating<T, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceUpdating<T, E>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Resource<$T, $E>.updating(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResourceUpdatingCopyWith<T,E,$Res> implements $ResourceCopyWith<T, E, $Res> {
  factory $ResourceUpdatingCopyWith(ResourceUpdating<T, E> value, $Res Function(ResourceUpdating<T, E>) _then) = _$ResourceUpdatingCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$ResourceUpdatingCopyWithImpl<T,E,$Res>
    implements $ResourceUpdatingCopyWith<T, E, $Res> {
  _$ResourceUpdatingCopyWithImpl(this._self, this._then);

  final ResourceUpdating<T, E> _self;
  final $Res Function(ResourceUpdating<T, E>) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ResourceUpdating<T, E>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc


class ResourceGettingMore<T,E> extends Resource<T, E> {
  const ResourceGettingMore(this.data): super._();
  

 final  T? data;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceGettingMoreCopyWith<T, E, ResourceGettingMore<T, E>> get copyWith => _$ResourceGettingMoreCopyWithImpl<T, E, ResourceGettingMore<T, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceGettingMore<T, E>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Resource<$T, $E>.gettingMore(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResourceGettingMoreCopyWith<T,E,$Res> implements $ResourceCopyWith<T, E, $Res> {
  factory $ResourceGettingMoreCopyWith(ResourceGettingMore<T, E> value, $Res Function(ResourceGettingMore<T, E>) _then) = _$ResourceGettingMoreCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$ResourceGettingMoreCopyWithImpl<T,E,$Res>
    implements $ResourceGettingMoreCopyWith<T, E, $Res> {
  _$ResourceGettingMoreCopyWithImpl(this._self, this._then);

  final ResourceGettingMore<T, E> _self;
  final $Res Function(ResourceGettingMore<T, E>) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ResourceGettingMore<T, E>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc


class ResourceLoaded<T,E> extends Resource<T, E> {
  const ResourceLoaded(this.data, {this.message}): super._();
  

 final  T data;
 final  String? message;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceLoadedCopyWith<T, E, ResourceLoaded<T, E>> get copyWith => _$ResourceLoadedCopyWithImpl<T, E, ResourceLoaded<T, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceLoaded<T, E>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'Resource<$T, $E>.loaded(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $ResourceLoadedCopyWith<T,E,$Res> implements $ResourceCopyWith<T, E, $Res> {
  factory $ResourceLoadedCopyWith(ResourceLoaded<T, E> value, $Res Function(ResourceLoaded<T, E>) _then) = _$ResourceLoadedCopyWithImpl;
@useResult
$Res call({
 T data, String? message
});




}
/// @nodoc
class _$ResourceLoadedCopyWithImpl<T,E,$Res>
    implements $ResourceLoadedCopyWith<T, E, $Res> {
  _$ResourceLoadedCopyWithImpl(this._self, this._then);

  final ResourceLoaded<T, E> _self;
  final $Res Function(ResourceLoaded<T, E>) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,}) {
  return _then(ResourceLoaded<T, E>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ResourceError<T,E> extends Resource<T, E> {
  const ResourceError(this.error): super._();
  

 final  E error;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceErrorCopyWith<T, E, ResourceError<T, E>> get copyWith => _$ResourceErrorCopyWithImpl<T, E, ResourceError<T, E>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceError<T, E>&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'Resource<$T, $E>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ResourceErrorCopyWith<T,E,$Res> implements $ResourceCopyWith<T, E, $Res> {
  factory $ResourceErrorCopyWith(ResourceError<T, E> value, $Res Function(ResourceError<T, E>) _then) = _$ResourceErrorCopyWithImpl;
@useResult
$Res call({
 E error
});




}
/// @nodoc
class _$ResourceErrorCopyWithImpl<T,E,$Res>
    implements $ResourceErrorCopyWith<T, E, $Res> {
  _$ResourceErrorCopyWithImpl(this._self, this._then);

  final ResourceError<T, E> _self;
  final $Res Function(ResourceError<T, E>) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ResourceError<T, E>(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as E,
  ));
}


}

// dart format on
