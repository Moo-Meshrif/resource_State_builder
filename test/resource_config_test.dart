import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

void main() {
  group('ResourceConfig', () {
    testWidgets('maybeOf returns null when no config exists', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final config = ResourceConfig.maybeOf<String>(context);
              expect(config, isNull);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('of throws when no config exists', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              late Object error;
              try {
                ResourceConfig.of<String>(context);
              } catch (e) {
                error = e;
              }
              expect(error, isAssertionError);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('retrieves config based on generic type', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<int>(
            defaultGlobalError: 100,
            child: ResourceConfig<String>(
              defaultGlobalError: 'Error',
              child: Builder(
                builder: (context) {
                  final strConfig = ResourceConfig.of<String>(context);
                  final intConfig = ResourceConfig.of<int>(context);
                  
                  expect(strConfig.defaultGlobalError, 'Error');
                  expect(intConfig.defaultGlobalError, 100);
                  
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('merges nested configs correctly', (tester) async {
      final globalEmpty = (BuildContext ctx, VoidCallback? r) => const Text('Global Empty');
      final globalLoading = (BuildContext ctx) => const Text('Global Loading');
      
      final localEmpty = (BuildContext ctx, VoidCallback? r) => const Text('Local Empty');

      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<String>(
            emptyBuilder: globalEmpty,
            loadingBuilder: globalLoading,
            defaultGlobalError: 'GlobalErr',
            child: ResourceConfig<String>(
              emptyBuilder: localEmpty, // Overrides empty
              defaultGlobalError: 'LocalErr', // Overrides err
              child: Builder(
                builder: (context) {
                  final config = ResourceConfig.of<String>(context);
                  
                  // Should take local
                  expect(config.defaultGlobalError, 'LocalErr');
                  expect(config.emptyBuilder, equals(localEmpty));
                  
                  // Should fallback to global
                  expect(config.loadingBuilder, equals(globalLoading));
                  expect(config.errorBuilder, isNull);
                  expect(config.paginationLoadingBuilder, isNull);
                  
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      );
    });

    testWidgets('updateShouldNotify correctly compares properties', (tester) async {
      final key = GlobalKey();
      
      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return ResourceConfig<String>(
                key: key,
                defaultGlobalError: 'Err',
                child: const SizedBox.shrink(),
              );
            },
          ),
        ),
      );

      final widget1 = tester.widget<ResourceConfig<String>>(find.byKey(key));
      
      final widget2 = ResourceConfig<String>(
        defaultGlobalError: 'Err',
        child: const SizedBox.shrink(),
      );
      
      final widget3 = ResourceConfig<String>(
        defaultGlobalError: 'DiffErr',
        child: const SizedBox.shrink(),
      );

      expect(widget1.updateShouldNotify(widget2), isFalse);
      expect(widget1.updateShouldNotify(widget3), isTrue);
    });
  });
}
