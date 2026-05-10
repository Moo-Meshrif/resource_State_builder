import 'resource_state.dart';

/// Contract that any paginated response should implement
/// so the UI layer can work with it generically.
abstract class PaginatedData<T> {
  List<T> get items;
  bool get hasMore;
}

extension ResourcePaginatedX<T, E> on Resource<PaginatedData<T>, E> {
  /// Safely removes items from the paginated list based on a predicate.
  Resource<P, E> removeWhere<P extends PaginatedData<T>>(
    bool Function(T item) test,
    P Function(List<T> items, P current) rebuild, {
    Resource<P, E> Function(P data)? mapStatus,
  }) {
    final self = this as Resource<P, E>;
    final currentData = self.data;
    if (currentData == null) return self;

    final updated = currentData.items.where((e) => !test(e)).toList();
    final newData = rebuild(updated, currentData);
    if (mapStatus != null) return mapStatus(newData);
    return self.copyWith(data: newData);
  }

  /// Merges [newPage] items onto the end of the current list.
  ///
  /// The [rebuild] callback receives the merged item list and the new page so
  /// you can copy pagination metadata (e.g. `hasMore`, cursors) from it.
  Resource<P, E> appendItems<P extends PaginatedData<T>>(
    P newPage,
    P Function(List<T> mergedItems, P newPage) rebuild, {
    Resource<P, E> Function(P data)? mapStatus,
  }) {
    final self = this as Resource<P, E>;
    final currentData = self.data;
    if (currentData == null) {
      final newData = rebuild(newPage.items, newPage);
      if (mapStatus != null) return mapStatus(newData);
      return Resource<P, E>.loaded(newData);
    }

    final merged = [...currentData.items, ...newPage.items];
    final newData = rebuild(merged, newPage);
    if (mapStatus != null) return mapStatus(newData);
    return self.copyWith(data: newData);
  }

  /// Inserts [newItems] at the beginning of the current list.
  ///
  /// The [rebuild] callback receives the updated list and the current page so
  /// you can preserve pagination metadata.
  Resource<P, E> prependItems<P extends PaginatedData<T>>(
    List<T> newItems,
    P Function(List<T> items, P current) rebuild, {
    Resource<P, E> Function(P data)? mapStatus,
  }) {
    final self = this as Resource<P, E>;
    final currentData = self.data;
    if (currentData == null) return self;

    final merged = [...newItems, ...currentData.items];
    final newData = rebuild(merged, currentData);
    if (mapStatus != null) return mapStatus(newData);
    return self.copyWith(data: newData);
  }

  /// Applies [update] to every item that satisfies [test] in-place.
  ///
  /// Non-matching items are left unchanged.
  Resource<P, E> updateWhere<P extends PaginatedData<T>>(
    bool Function(T item) test,
    T Function(T item) update,
    P Function(List<T> items, P current) rebuild, {
    Resource<P, E> Function(P data)? mapStatus,
  }) {
    final self = this as Resource<P, E>;
    final currentData = self.data;
    if (currentData == null) return self;

    final updated = currentData.items
        .map((e) => test(e) ? update(e) : e)
        .toList();
    final newData = rebuild(updated, currentData);
    if (mapStatus != null) return mapStatus(newData);
    return self.copyWith(data: newData);
  }

  /// Replaces every item that satisfies [test] with [newItem].
  Resource<P, E> replaceWhere<P extends PaginatedData<T>>(
    bool Function(T item) test,
    T newItem,
    P Function(List<T> items, P current) rebuild, {
    Resource<P, E> Function(P data)? mapStatus,
  }) {
    return updateWhere(test, (_) => newItem, rebuild, mapStatus: mapStatus);
  }

  /// Inserts [item] at the given [index] (clamped to valid range).
  ///
  /// An [index] of 0 prepends; an [index] ≥ list length appends.
  Resource<P, E> insertAt<P extends PaginatedData<T>>(
    int index,
    T item,
    P Function(List<T> items, P current) rebuild, {
    Resource<P, E> Function(P data)? mapStatus,
  }) {
    final self = this as Resource<P, E>;
    final currentData = self.data;
    if (currentData == null) return self;

    final list = List<T>.from(currentData.items);
    final safeIndex = index.clamp(0, list.length);
    list.insert(safeIndex, item);

    final newData = rebuild(list, currentData);
    if (mapStatus != null) return mapStatus(newData);
    return self.copyWith(data: newData);
  }
}
