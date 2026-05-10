import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

class MockPaginatedData implements PaginatedData<String> {
  @override
  final List<String> items;
  @override
  final bool hasMore;

  MockPaginatedData(this.items, this.hasMore);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MockPaginatedData &&
          _listEquals(items, other.items) &&
          hasMore == other.hasMore;

  @override
  int get hashCode => items.hashCode ^ hasMore.hashCode;
}

bool _listEquals(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

void main() {
  group('Pagination Extensions on Resource', () {
    late Resource<MockPaginatedData, String> resource;

    setUp(() {
      resource = Resource.loaded(MockPaginatedData(['A', 'B'], true));
    });

    MockPaginatedData rebuild(List<String> items, MockPaginatedData current) {
      return MockPaginatedData(items, current.hasMore);
    }

    test('removeWhere removes correctly', () {
      final updated = resource.removeWhere<MockPaginatedData>(
        (item) => item == 'A',
        rebuild,
      );
      expect(updated.data?.items, ['B']);
    });

    test('removeWhere ignores null data', () {
      const emptyRes = Resource<MockPaginatedData, String>.initial();
      final updated = emptyRes.removeWhere<MockPaginatedData>(
        (item) => item == 'A',
        rebuild,
      );
      expect(updated.isInitial, true);
    });

    test('appendItems merges list correctly', () {
      final newPage = MockPaginatedData(['C', 'D'], false);
      final updated = resource.appendItems<MockPaginatedData>(newPage, rebuild);
      
      expect(updated.data?.items, ['A', 'B', 'C', 'D']);
      expect(updated.data?.hasMore, false); // rebuilt with newPage's hasMore
    });

    test('appendItems handles null current data', () {
      const emptyRes = Resource<MockPaginatedData, String>.initial();
      final newPage = MockPaginatedData(['A', 'B'], false);
      final updated = emptyRes.appendItems<MockPaginatedData>(newPage, rebuild);
      
      expect(updated.data?.items, ['A', 'B']);
    });

    test('prependItems inserts at the beginning', () {
      final updated = resource.prependItems<MockPaginatedData>(
        ['X', 'Y'],
        rebuild,
      );
      expect(updated.data?.items, ['X', 'Y', 'A', 'B']);
    });

    test('updateWhere updates items matching predicate', () {
      final updated = resource.updateWhere<MockPaginatedData>(
        (item) => item == 'A',
        (item) => 'A_updated',
        rebuild,
      );
      expect(updated.data?.items, ['A_updated', 'B']);
    });

    test('replaceWhere replaces items matching predicate', () {
      final updated = resource.replaceWhere<MockPaginatedData>(
        (item) => item == 'B',
        'C',
        rebuild,
      );
      expect(updated.data?.items, ['A', 'C']);
    });

    test('insertAt inserts at valid index', () {
      var updated = resource.insertAt<MockPaginatedData>(1, 'X', rebuild);
      expect(updated.data?.items, ['A', 'X', 'B']);

      // Clamp test
      updated = updated.insertAt<MockPaginatedData>(-5, 'Y', rebuild);
      expect(updated.data?.items, ['Y', 'A', 'X', 'B']);

      updated = updated.insertAt<MockPaginatedData>(100, 'Z', rebuild);
      expect(updated.data?.items, ['Y', 'A', 'X', 'B', 'Z']);
    });

    test('mapStatus correctly overrides the returned status', () {
      final updated = resource.removeWhere<MockPaginatedData>(
        (item) => item == 'A',
        rebuild,
        mapStatus: (data) => Resource.error('Forced error'),
      );
      expect(updated.isError, true);
    });
  });
}
