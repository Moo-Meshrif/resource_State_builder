import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

void main() {
  group('Resource Flags', () {
    test('isInitial', () {
      const res = Resource<String, String>.initial();
      expect(res.isInitial, true);
      expect(res.isLoading, false);
      expect(res.isLoaded, false);
      expect(res.isError, false);
    });

    test('isLoading', () {
      const res = Resource<String, String>.loading();
      expect(res.isLoading, true);
      expect(res.isInitial, false);
    });

    test('isPopUpLoading', () {
      const res = Resource<String, String>.popUpLoading();
      expect(res.isPopUpLoading, true);
      expect(res.isLoading, false);
    });

    test('isRedirectLoading', () {
      const res = Resource<String, String>.redirectLoading();
      expect(res.isRedirectLoading, true);
    });

    test('isUpdating', () {
      const res = Resource<String, String>.updating('old');
      expect(res.isUpdating, true);
      expect(res.data, 'old');
    });

    test('isGettingMore', () {
      const res = Resource<String, String>.gettingMore('some data');
      expect(res.isGettingMore, true);
      expect(res.data, 'some data');
    });

    test('isLoaded', () {
      const res = Resource<String, String>.loaded('hello', message: 'success');
      expect(res.isLoaded, true);
      expect(res.data, 'hello');
      expect(res.successMessage, 'success');
    });

    test('isError', () {
      const res = Resource<String, String>.error('failed');
      expect(res.isError, true);
      expect(res.error, 'failed');
      expect(res.data, null);
    });
  });

  group('Resource Transition Extensions', () {
    test('toLoading transitions correctly based on flags', () {
      const res = Resource<String, String>.loaded('data');
      
      expect(res.toLoading().isLoading, true);
      expect(res.toLoading(refresh: true).isUpdating, true);
      expect(res.toLoading(refresh: true).data, 'data');
      
      expect(res.toLoading(redirect: true).isRedirectLoading, true);
      
      // redirect takes precedence
      expect(res.toLoading(refresh: true, redirect: true).isRedirectLoading, true);
    });

    test('toGettingMore transitions correctly', () {
      const res = Resource<String, String>.loaded('data');
      final more = res.toGettingMore();
      expect(more.isGettingMore, true);
      expect(more.data, 'data');
    });

    test('toPopUpLoading transitions correctly', () {
      const res = Resource<String, String>.loaded('data');
      expect(res.toPopUpLoading().isPopUpLoading, true);
    });

    test('copyWith updates data and error safely', () {
      final loaded = const Resource<String, String>.loaded('A');
      expect(loaded.copyWith(data: 'B').data, 'B');
      
      final updating = const Resource<String, String>.updating('A');
      expect(updating.copyWith(data: 'C').data, 'C');

      final gettingMore = const Resource<String, String>.gettingMore('A');
      expect(gettingMore.copyWith(data: 'D').data, 'D');

      final errorRes = const Resource<String, String>.error('Err1');
      expect(errorRes.copyWith(error: 'Err2').error, 'Err2');
      
      // Initial state ignores copyWith data
      final initial = const Resource<String, String>.initial();
      expect(initial.copyWith(data: 'X').isInitial, true);
    });
  });

  group('ResourceAggregator Iterable Extensions', () {
    test('isAllLoading evaluates correctly', () {
      final list1 = <Resource<dynamic, dynamic>>[
        const Resource.loading(),
        const Resource.popUpLoading(),
      ];
      expect(list1.isAllLoading, true);

      final list2 = <Resource<dynamic, dynamic>>[
        const Resource.loading(),
        const Resource.loaded('data'),
      ];
      expect(list2.isAllLoading, false);
    });

    test('isAllRedirectLoading evaluates correctly', () {
      final list = <Resource<dynamic, dynamic>>[
        const Resource.redirectLoading(),
        const Resource.redirectLoading(),
      ];
      expect(list.isAllRedirectLoading, true);
    });

    test('hasAllError evaluates correctly', () {
      final list = <Resource<dynamic, dynamic>>[
        const Resource.error('E1'),
        const Resource.error('E2'),
      ];
      expect(list.hasAllError, true);
    });

    test('isAllEmpty evaluates correctly', () {
      final list = <Resource<dynamic, dynamic>>[
        const Resource.initial(), // data is null, not loading, not error
        const Resource.updating(null), // data is null, not loading, not error
      ];
      expect(list.isAllEmpty, true);

      final notEmpty = <Resource<dynamic, dynamic>>[
        const Resource.loaded('data'),
      ];
      expect(notEmpty.isAllEmpty, false);
    });

    test('toAggregate resolves correct global state', () {
      final allLoad = <Resource<dynamic, dynamic>>[
        const Resource.loading(),
      ];
      expect(allLoad.toAggregate('value', 'err').isLoading, true);

      final allRedirect = <Resource<dynamic, dynamic>>[
        const Resource.redirectLoading(),
      ];
      expect(allRedirect.toAggregate('value', 'err').isRedirectLoading, true);

      final allErr = <Resource<dynamic, dynamic>>[
        const Resource.error('X'),
        const Resource.error('Y'),
      ];
      final errAgg = allErr.toAggregate<String, String>('value', 'globalErr');
      expect(errAgg.isError, true);
      expect(errAgg.error, 'globalErr');

      final mixed = <Resource<dynamic, dynamic>>[
        const Resource.loaded('data'),
        const Resource.loading(), // mixed means not ALL loading, not ALL error
      ];
      final mixedAgg = mixed.toAggregate<String, String>('value', 'err');
      expect(mixedAgg.isLoaded, true);
      expect(mixedAgg.data, 'value');
    });
  });
}
