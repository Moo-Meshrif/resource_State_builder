import 'resource_state.dart';

/// Contract that any paginated response should implement
/// so the UI layer can work with it generically.
abstract class PaginatedData<T> {
  List<T> get items;
  bool get hasMore;
}

extension ResourcePaginatedX<T, E, P extends PaginatedData<T>>
    on Resource<P, E> {
  /// Safely removes items from the paginated list based on a predicate.
  Resource<P, E> removeWhere(
    bool Function(T item) test,
    P Function(List<T> items, P current) rebuild,
  ) {
    final currentData = data;
    if (currentData == null) return this;

    final updated = currentData.items.where((e) => !test(e)).toList();
    return copyWithData(rebuild(updated, currentData));
  }
}
