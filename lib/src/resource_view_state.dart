import 'pagination.dart';
import 'resource_state.dart';

/// Represents the visual states a [Resource] can be in.
enum ResourceViewState {
  /// The resource is currently fetching data and has no data yet (for retried requests).
  redirectLoading,

  /// The resource is currently fetching data and has no data yet.
  loading,

  /// An error occurred while fetching data and no data is available.
  error,

  /// The resource was fetched successfully but the data is null or empty.
  empty,

  /// data is available (might still be refreshing in the background).
  data,
}

/// Resolves the [ResourceViewState] based on the current state of a [Resource].
ResourceViewState resolveState<T, E>(Resource<T, E> resource) {
  if (resource.isError && resource.data == null) {
    return ResourceViewState.error;
  }

  if (resource.isRedirectLoading) {
    return ResourceViewState.redirectLoading;
  }

  if (resource.isLoading) {
    return ResourceViewState.loading;
  }

  final data = resource.data;
  if (data == null) return ResourceViewState.empty;
  if (data is Iterable && data.isEmpty) return ResourceViewState.empty;
  if (data is Map && data.isEmpty) return ResourceViewState.empty;
  if (data is PaginatedData && data.items.isEmpty) {
    return ResourceViewState.empty;
  }
  return ResourceViewState.data;
}
