import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_state.freezed.dart';

/// A generic UI state wrapper that represents the lifecycle
/// of a resource (API call, local fetch, pagination, refresh, etc).
///
/// This model is intentionally UI-focused and should NOT be used
/// directly inside the data layer.
@freezed
sealed class Resource<T, E> with _$Resource<T, E> {
  const Resource._();

  /// Initial idle state.
  /// Used before any action or request is triggered.
  const factory Resource.initial() = ResourceInitial<T, E>;

  /// First-time loading state.
  /// Usually used for full-screen loaders.
  const factory Resource.loading() = ResourceLoading<T, E>;

  /// Global / blocking loading state.
  /// Example: dialog, overlay loader, or critical blocking action.
  const factory Resource.popUpLoading() = ResourcePopUpLoading<T, E>;

  /// Redirect loading state.
  /// change skeleton loading to simple loading when try to load data after failed
  /// but you need to use toLoading() with redirect: true.
  const factory Resource.redirectLoading() = ResourceRedirectLoading<T, E>;

  /// Background refresh state.
  /// Keeps old data visible while fetching new data.
  const factory Resource.updating(T? data) = ResourceUpdating<T, E>;

  /// Pagination / infinite scroll loading state.
  /// Appends new data while keeping the current list visible.
  const factory Resource.gettingMore(T? data) = ResourceGettingMore<T, E>;

  /// Successful state with fresh data.
  const factory Resource.loaded(T data, {String? message}) =
      ResourceLoaded<T, E>;

  /// Failed state with domain-level error.
  const factory Resource.error(E error) = ResourceError<T, E>;
}

/// Convenience helpers to make UI & BLoC code more expressive.
extension ResourceExtension<T, E> on Resource<T, E> {
  /// State flags (used mainly in UI layer)
  bool get isInitial => this is ResourceInitial<T, E>;
  bool get isLoading => this is ResourceLoading<T, E>;
  bool get isPopUpLoading => this is ResourcePopUpLoading<T, E>;
  bool get isRedirectLoading => this is ResourceRedirectLoading<T, E>;
  bool get isUpdating => this is ResourceUpdating<T, E>;
  bool get isGettingMore => this is ResourceGettingMore<T, E>;
  bool get isLoaded => this is ResourceLoaded<T, E>;
  bool get isError => this is ResourceError<T, E>;

  /// Extracts data when available.
  ///
  /// Data exists only in:
  /// - loaded
  /// - updating
  /// - gettingMore
  T? get data => maybeMap(
    loaded: (s) => s.data,
    updating: (s) => s.data,
    gettingMore: (s) => s.data,
    orElse: () => null,
  );

  /// Extracts the error if the state is [ResourceError].
  E? get error => maybeMap(error: (s) => s.error, orElse: () => null);

  /// Extracts the success message if the state is [ResourceLoaded].
  String? get successMessage =>
      maybeMap(loaded: (s) => s.message, orElse: () => null);

  /// Converts current state into a loading variant.
  ///
  /// Priority:
  /// - redirect = true -> redirectLoading
  /// - refresh  = true -> updating (keeps old data)
  /// - otherwise       -> loading
  Resource<T, E> toLoading({bool refresh = false, bool redirect = false}) {
    if (redirect) return Resource<T, E>.redirectLoading();
    if (refresh) return Resource<T, E>.updating(data);
    return Resource<T, E>.loading();
  }

  /// Safely updates data or error without breaking state integrity.
  ///
  /// - Only updates data where it is valid
  /// - Prevents invalid state transitions
  Resource<T, E> copyWith({T? data, E? error}) => maybeMap(
    loaded: (s) => s.copyWith(data: data ?? s.data),
    updating: (s) => s.copyWith(data: data ?? s.data),
    gettingMore: (s) => s.copyWith(data: data ?? s.data),
    error: (s) => error != null ? Resource<T, E>.error(error) : s,
    orElse: () => this,
  );
}

/// Aggregates multiple [Resource] instances into a single UI state.
///
/// Useful for screens that depend on multiple API calls
/// (e.g., profile + settings + permissions).
extension ResourceAggregator on Iterable<Resource<dynamic, dynamic>> {
  /// Returns true if ANY resource is showing a global loader.
  bool get isAnyLoading => any((s) => s.isRedirectLoading);

  /// Returns true if ANY resource is in an error state.
  bool get hasError => any((s) => s.isError);

  /// Returns the first encountered error (if any).
  dynamic get error => fold<dynamic>(null, (prev, s) => prev ?? s.error);

  /// Combines all resources into a single [Resource<T, E>].
  ///
  /// Priority:
  /// 1. Any error        -> [Resource.error]
  /// 2. Any global load  -> [Resource.redirectLoading]
  /// 3. Otherwise        -> [Resource.loaded]
  Resource<T, E> toAggregate<T, E>(T value) {
    if (hasError) {
      return Resource<T, E>.error(error as E);
    } else if (isAnyLoading) {
      return Resource<T, E>.redirectLoading();
    }
    return Resource<T, E>.loaded(value);
  }
}
