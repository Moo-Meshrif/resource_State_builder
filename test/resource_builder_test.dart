import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

void main() {
  group('ResourceBuilder', () {
    testWidgets('renders builder when loaded with data', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResourceBuilder<String, String>(
              resource: const Resource.loaded('Test Data'),
              builder: (context, data) => Text('Data: $data'),
            ),
          ),
        ),
      );

      expect(find.text('Data: Test Data'), findsOneWidget);
    });

    testWidgets('renders local loading when loading', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResourceBuilder<String, String>(
              resource: const Resource.loading(),
              loading: const Text('Local Loading...'),
              builder: (context, data) => Text('Data: $data'),
            ),
          ),
        ),
      );

      expect(find.text('Local Loading...'), findsOneWidget);
    });

    testWidgets('renders global loading from config when local is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<String>(
            loadingBuilder: (ctx) => const Text('Global Loading...'),
            child: Scaffold(
              body: ResourceBuilder<String, String>(
                resource: const Resource.loading(),
                builder: (context, data) => Text('Data: $data'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Global Loading...'), findsOneWidget);
    });

    testWidgets(
      'renders default CircularProgressIndicator when no loading config',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ResourceBuilder<String, String>(
                resource: const Resource.loading(),
                builder: (context, data) => Text('Data: $data'),
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'renders skeleton when useSkeleton is true and initialData is provided',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ResourceBuilder<String, String>(
                resource: const Resource.loading(),
                useSkeleton: true,
                initialData: 'Skeleton Data',
                builder: (context, data) => Text('Data: $data'),
              ),
            ),
          ),
        );

        // Skeletonizer library uses private _Skeletonizer classes, so we just
        // verify that the initialData is actually rendered in the builder.
        expect(find.text('Data: Skeleton Data'), findsOneWidget);
      },
    );

    testWidgets('does not render skeleton when isRedirectLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResourceBuilder<String, String>(
              resource: const Resource.redirectLoading(),
              useSkeleton: true,
              initialData: 'Skeleton Data',
              loading: const Text('Redirect Loader'),
              builder: (context, data) => Text('Data: $data'),
            ),
          ),
        ),
      );

      expect(find.text('Data: Skeleton Data'), findsNothing);
      expect(find.text('Redirect Loader'), findsOneWidget);
    });

    testWidgets('renders local error when error occurs', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResourceBuilder<String, String>(
              resource: const Resource.error('LocalErr'),
              error: (ctx, err) => Text('Error is $err'),
              builder: (context, data) => Text('Data: $data'),
            ),
          ),
        ),
      );

      expect(find.text('Error is LocalErr'), findsOneWidget);
    });

    testWidgets('renders global error from config when local is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<String>(
            errorBuilder: (ctx, err, retry) => Text('Global Error: $err'),
            child: Scaffold(
              body: ResourceBuilder<String, String>(
                resource: const Resource.error('GlobalErr'),
                builder: (context, data) => Text('Data: $data'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Global Error: GlobalErr'), findsOneWidget);
    });

    testWidgets('renders local empty when empty', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResourceBuilder<String, String>(
              resource: const Resource.initial(), // empty state
              empty: const Text('Local Empty'),
              builder: (context, data) => Text('Data: $data'),
            ),
          ),
        ),
      );

      expect(find.text('Local Empty'), findsOneWidget);
    });

    testWidgets('renders global empty from config when local is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<String>(
            emptyBuilder: (ctx, retry) => const Text('Global Empty'),
            child: Scaffold(
              body: ResourceBuilder<String, String>(
                resource: const Resource.initial(),
                builder: (context, data) => Text('Data: $data'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Global Empty'), findsOneWidget);
    });

    testWidgets('renders sliver when useSliver is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                ResourceBuilder<String, String>(
                  resource: const Resource.loaded('Sliver Data'),
                  useSliver: true,
                  builder: (context, data) =>
                      SliverToBoxAdapter(child: Text('Sliver: $data')),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(SliverToBoxAdapter), findsOneWidget);
      expect(find.text('Sliver: Sliver Data'), findsOneWidget);
    });

    testWidgets(
      'renders sliver loader with sliver adapter when useSliver is true',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  ResourceBuilder<String, String>(
                    resource: const Resource.loading(),
                    useSliver: true,
                    loading: const Text('Sliver Loader'),
                    builder: (context, data) =>
                        SliverToBoxAdapter(child: Text('Data: $data')),
                  ),
                ],
              ),
            ),
          ),
        );

        // _adapter wraps child in SliverToBoxAdapter
        final adapterFinder = find.ancestor(
          of: find.text('Sliver Loader'),
          matching: find.byType(SliverToBoxAdapter),
        );
        expect(adapterFinder, findsOneWidget);
      },
    );

    testWidgets('uses custom sliver adapter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                ResourceBuilder<String, String>(
                  resource: const Resource.loading(),
                  useSliver: true,
                  sliverAdapter: (child) => SliverPadding(
                    padding: const EdgeInsets.all(8),
                    sliver: SliverToBoxAdapter(child: child),
                  ),
                  loading: const Text('Sliver Loader'),
                  builder: (context, data) =>
                      SliverToBoxAdapter(child: Text('Data: $data')),
                ),
              ],
            ),
          ),
        ),
      );

      final paddingFinder = find.ancestor(
        of: find.text('Sliver Loader'),
        matching: find.byType(SliverPadding),
      );
      expect(paddingFinder, findsOneWidget);
    });

    testWidgets(
      'renders sliver skeleton when useSkeleton and useSliver are both true',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomScrollView(
                slivers: [
                  ResourceBuilder<String, String>(
                    resource: const Resource.loading(),
                    useSkeleton: true,
                    useSliver: true,
                    initialData: 'Skeleton Data',
                    builder: (context, data) =>
                        SliverToBoxAdapter(child: Text('Sliver: $data')),
                  ),
                ],
              ),
            ),
          ),
        );

        // Just assert the data is built.
        expect(find.text('Sliver: Skeleton Data'), findsOneWidget);
      },
    );
  });
}
