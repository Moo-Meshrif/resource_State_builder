// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Resource<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<T, E, $Res> {
  factory $ResourceCopyWith(
          Resource<T, E> value, $Res Function(Resource<T, E>) then) =
      _$ResourceCopyWithImpl<T, E, $Res, Resource<T, E>>;
}

/// @nodoc
class _$ResourceCopyWithImpl<T, E, $Res, $Val extends Resource<T, E>>
    implements $ResourceCopyWith<T, E, $Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResourceInitialImplCopyWith<T, E, $Res> {
  factory _$$ResourceInitialImplCopyWith(_$ResourceInitialImpl<T, E> value,
          $Res Function(_$ResourceInitialImpl<T, E>) then) =
      __$$ResourceInitialImplCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$ResourceInitialImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourceInitialImpl<T, E>>
    implements _$$ResourceInitialImplCopyWith<T, E, $Res> {
  __$$ResourceInitialImplCopyWithImpl(_$ResourceInitialImpl<T, E> _value,
      $Res Function(_$ResourceInitialImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResourceInitialImpl<T, E> extends ResourceInitial<T, E> {
  const _$ResourceInitialImpl() : super._();

  @override
  String toString() {
    return 'Resource<$T, $E>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceInitialImpl<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResourceInitial<T, E> extends Resource<T, E> {
  const factory ResourceInitial() = _$ResourceInitialImpl<T, E>;
  const ResourceInitial._() : super._();
}

/// @nodoc
abstract class _$$ResourceLoadingImplCopyWith<T, E, $Res> {
  factory _$$ResourceLoadingImplCopyWith(_$ResourceLoadingImpl<T, E> value,
          $Res Function(_$ResourceLoadingImpl<T, E>) then) =
      __$$ResourceLoadingImplCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$ResourceLoadingImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourceLoadingImpl<T, E>>
    implements _$$ResourceLoadingImplCopyWith<T, E, $Res> {
  __$$ResourceLoadingImplCopyWithImpl(_$ResourceLoadingImpl<T, E> _value,
      $Res Function(_$ResourceLoadingImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResourceLoadingImpl<T, E> extends ResourceLoading<T, E> {
  const _$ResourceLoadingImpl() : super._();

  @override
  String toString() {
    return 'Resource<$T, $E>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceLoadingImpl<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResourceLoading<T, E> extends Resource<T, E> {
  const factory ResourceLoading() = _$ResourceLoadingImpl<T, E>;
  const ResourceLoading._() : super._();
}

/// @nodoc
abstract class _$$ResourcePopUpLoadingImplCopyWith<T, E, $Res> {
  factory _$$ResourcePopUpLoadingImplCopyWith(
          _$ResourcePopUpLoadingImpl<T, E> value,
          $Res Function(_$ResourcePopUpLoadingImpl<T, E>) then) =
      __$$ResourcePopUpLoadingImplCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$ResourcePopUpLoadingImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourcePopUpLoadingImpl<T, E>>
    implements _$$ResourcePopUpLoadingImplCopyWith<T, E, $Res> {
  __$$ResourcePopUpLoadingImplCopyWithImpl(
      _$ResourcePopUpLoadingImpl<T, E> _value,
      $Res Function(_$ResourcePopUpLoadingImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResourcePopUpLoadingImpl<T, E> extends ResourcePopUpLoading<T, E> {
  const _$ResourcePopUpLoadingImpl() : super._();

  @override
  String toString() {
    return 'Resource<$T, $E>.popUpLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourcePopUpLoadingImpl<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return popUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return popUpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (popUpLoading != null) {
      return popUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return popUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return popUpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (popUpLoading != null) {
      return popUpLoading(this);
    }
    return orElse();
  }
}

abstract class ResourcePopUpLoading<T, E> extends Resource<T, E> {
  const factory ResourcePopUpLoading() = _$ResourcePopUpLoadingImpl<T, E>;
  const ResourcePopUpLoading._() : super._();
}

/// @nodoc
abstract class _$$ResourceRedirectLoadingImplCopyWith<T, E, $Res> {
  factory _$$ResourceRedirectLoadingImplCopyWith(
          _$ResourceRedirectLoadingImpl<T, E> value,
          $Res Function(_$ResourceRedirectLoadingImpl<T, E>) then) =
      __$$ResourceRedirectLoadingImplCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$ResourceRedirectLoadingImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res,
        _$ResourceRedirectLoadingImpl<T, E>>
    implements _$$ResourceRedirectLoadingImplCopyWith<T, E, $Res> {
  __$$ResourceRedirectLoadingImplCopyWithImpl(
      _$ResourceRedirectLoadingImpl<T, E> _value,
      $Res Function(_$ResourceRedirectLoadingImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResourceRedirectLoadingImpl<T, E>
    extends ResourceRedirectLoading<T, E> {
  const _$ResourceRedirectLoadingImpl() : super._();

  @override
  String toString() {
    return 'Resource<$T, $E>.redirectLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceRedirectLoadingImpl<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return redirectLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return redirectLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (redirectLoading != null) {
      return redirectLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return redirectLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return redirectLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (redirectLoading != null) {
      return redirectLoading(this);
    }
    return orElse();
  }
}

abstract class ResourceRedirectLoading<T, E> extends Resource<T, E> {
  const factory ResourceRedirectLoading() = _$ResourceRedirectLoadingImpl<T, E>;
  const ResourceRedirectLoading._() : super._();
}

/// @nodoc
abstract class _$$ResourceUpdatingImplCopyWith<T, E, $Res> {
  factory _$$ResourceUpdatingImplCopyWith(_$ResourceUpdatingImpl<T, E> value,
          $Res Function(_$ResourceUpdatingImpl<T, E>) then) =
      __$$ResourceUpdatingImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ResourceUpdatingImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourceUpdatingImpl<T, E>>
    implements _$$ResourceUpdatingImplCopyWith<T, E, $Res> {
  __$$ResourceUpdatingImplCopyWithImpl(_$ResourceUpdatingImpl<T, E> _value,
      $Res Function(_$ResourceUpdatingImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResourceUpdatingImpl<T, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResourceUpdatingImpl<T, E> extends ResourceUpdating<T, E> {
  const _$ResourceUpdatingImpl(this.data) : super._();

  @override
  final T? data;

  @override
  String toString() {
    return 'Resource<$T, $E>.updating(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceUpdatingImpl<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceUpdatingImplCopyWith<T, E, _$ResourceUpdatingImpl<T, E>>
      get copyWith => __$$ResourceUpdatingImplCopyWithImpl<T, E,
          _$ResourceUpdatingImpl<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return updating(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return updating?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class ResourceUpdating<T, E> extends Resource<T, E> {
  const factory ResourceUpdating(final T? data) = _$ResourceUpdatingImpl<T, E>;
  const ResourceUpdating._() : super._();

  T? get data;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceUpdatingImplCopyWith<T, E, _$ResourceUpdatingImpl<T, E>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceGettingMoreImplCopyWith<T, E, $Res> {
  factory _$$ResourceGettingMoreImplCopyWith(
          _$ResourceGettingMoreImpl<T, E> value,
          $Res Function(_$ResourceGettingMoreImpl<T, E>) then) =
      __$$ResourceGettingMoreImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ResourceGettingMoreImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourceGettingMoreImpl<T, E>>
    implements _$$ResourceGettingMoreImplCopyWith<T, E, $Res> {
  __$$ResourceGettingMoreImplCopyWithImpl(
      _$ResourceGettingMoreImpl<T, E> _value,
      $Res Function(_$ResourceGettingMoreImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResourceGettingMoreImpl<T, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResourceGettingMoreImpl<T, E> extends ResourceGettingMore<T, E> {
  const _$ResourceGettingMoreImpl(this.data) : super._();

  @override
  final T? data;

  @override
  String toString() {
    return 'Resource<$T, $E>.gettingMore(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceGettingMoreImpl<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceGettingMoreImplCopyWith<T, E, _$ResourceGettingMoreImpl<T, E>>
      get copyWith => __$$ResourceGettingMoreImplCopyWithImpl<T, E,
          _$ResourceGettingMoreImpl<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return gettingMore(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return gettingMore?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (gettingMore != null) {
      return gettingMore(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return gettingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return gettingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (gettingMore != null) {
      return gettingMore(this);
    }
    return orElse();
  }
}

abstract class ResourceGettingMore<T, E> extends Resource<T, E> {
  const factory ResourceGettingMore(final T? data) =
      _$ResourceGettingMoreImpl<T, E>;
  const ResourceGettingMore._() : super._();

  T? get data;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceGettingMoreImplCopyWith<T, E, _$ResourceGettingMoreImpl<T, E>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceLoadedImplCopyWith<T, E, $Res> {
  factory _$$ResourceLoadedImplCopyWith(_$ResourceLoadedImpl<T, E> value,
          $Res Function(_$ResourceLoadedImpl<T, E>) then) =
      __$$ResourceLoadedImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T data, String? message});
}

/// @nodoc
class __$$ResourceLoadedImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourceLoadedImpl<T, E>>
    implements _$$ResourceLoadedImplCopyWith<T, E, $Res> {
  __$$ResourceLoadedImplCopyWithImpl(_$ResourceLoadedImpl<T, E> _value,
      $Res Function(_$ResourceLoadedImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ResourceLoadedImpl<T, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ResourceLoadedImpl<T, E> extends ResourceLoaded<T, E> {
  const _$ResourceLoadedImpl(this.data, {this.message}) : super._();

  @override
  final T data;
  @override
  final String? message;

  @override
  String toString() {
    return 'Resource<$T, $E>.loaded(data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceLoadedImpl<T, E> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), message);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceLoadedImplCopyWith<T, E, _$ResourceLoadedImpl<T, E>>
      get copyWith =>
          __$$ResourceLoadedImplCopyWithImpl<T, E, _$ResourceLoadedImpl<T, E>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return loaded(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return loaded?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ResourceLoaded<T, E> extends Resource<T, E> {
  const factory ResourceLoaded(final T data, {final String? message}) =
      _$ResourceLoadedImpl<T, E>;
  const ResourceLoaded._() : super._();

  T get data;
  String? get message;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceLoadedImplCopyWith<T, E, _$ResourceLoadedImpl<T, E>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceErrorImplCopyWith<T, E, $Res> {
  factory _$$ResourceErrorImplCopyWith(_$ResourceErrorImpl<T, E> value,
          $Res Function(_$ResourceErrorImpl<T, E>) then) =
      __$$ResourceErrorImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({E error});
}

/// @nodoc
class __$$ResourceErrorImplCopyWithImpl<T, E, $Res>
    extends _$ResourceCopyWithImpl<T, E, $Res, _$ResourceErrorImpl<T, E>>
    implements _$$ResourceErrorImplCopyWith<T, E, $Res> {
  __$$ResourceErrorImplCopyWithImpl(_$ResourceErrorImpl<T, E> _value,
      $Res Function(_$ResourceErrorImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ResourceErrorImpl<T, E>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$ResourceErrorImpl<T, E> extends ResourceError<T, E> {
  const _$ResourceErrorImpl(this.error) : super._();

  @override
  final E error;

  @override
  String toString() {
    return 'Resource<$T, $E>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceErrorImpl<T, E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceErrorImplCopyWith<T, E, _$ResourceErrorImpl<T, E>> get copyWith =>
      __$$ResourceErrorImplCopyWithImpl<T, E, _$ResourceErrorImpl<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() popUpLoading,
    required TResult Function() redirectLoading,
    required TResult Function(T? data) updating,
    required TResult Function(T? data) gettingMore,
    required TResult Function(T data, String? message) loaded,
    required TResult Function(E error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? popUpLoading,
    TResult? Function()? redirectLoading,
    TResult? Function(T? data)? updating,
    TResult? Function(T? data)? gettingMore,
    TResult? Function(T data, String? message)? loaded,
    TResult? Function(E error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? popUpLoading,
    TResult Function()? redirectLoading,
    TResult Function(T? data)? updating,
    TResult Function(T? data)? gettingMore,
    TResult Function(T data, String? message)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T, E> value) initial,
    required TResult Function(ResourceLoading<T, E> value) loading,
    required TResult Function(ResourcePopUpLoading<T, E> value) popUpLoading,
    required TResult Function(ResourceRedirectLoading<T, E> value)
        redirectLoading,
    required TResult Function(ResourceUpdating<T, E> value) updating,
    required TResult Function(ResourceGettingMore<T, E> value) gettingMore,
    required TResult Function(ResourceLoaded<T, E> value) loaded,
    required TResult Function(ResourceError<T, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T, E> value)? initial,
    TResult? Function(ResourceLoading<T, E> value)? loading,
    TResult? Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult? Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult? Function(ResourceUpdating<T, E> value)? updating,
    TResult? Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult? Function(ResourceLoaded<T, E> value)? loaded,
    TResult? Function(ResourceError<T, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T, E> value)? initial,
    TResult Function(ResourceLoading<T, E> value)? loading,
    TResult Function(ResourcePopUpLoading<T, E> value)? popUpLoading,
    TResult Function(ResourceRedirectLoading<T, E> value)? redirectLoading,
    TResult Function(ResourceUpdating<T, E> value)? updating,
    TResult Function(ResourceGettingMore<T, E> value)? gettingMore,
    TResult Function(ResourceLoaded<T, E> value)? loaded,
    TResult Function(ResourceError<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResourceError<T, E> extends Resource<T, E> {
  const factory ResourceError(final E error) = _$ResourceErrorImpl<T, E>;
  const ResourceError._() : super._();

  E get error;

  /// Create a copy of Resource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResourceErrorImplCopyWith<T, E, _$ResourceErrorImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
