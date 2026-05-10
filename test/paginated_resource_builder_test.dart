import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

class MockPaginatedData implements PaginatedData<String> {
  @override
  final List<String> items;
  @override
  final bool hasMore;

  MockPaginatedData(this.items, this.hasMore);
}

void main() {
  group('PaginatedResourceBuilder', () {
    testWidgets('renders items using itemBuilder', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: Resource.loaded(MockPaginatedData(['A', 'B'], false)),
              hasInternalScroll: true,
              itemBuilder: (context, index, item) => Text('Item $index: $item'),
            ),
          ),
        ),
      );

      expect(find.text('Item 0: A'), findsOneWidget);
      expect(find.text('Item 1: B'), findsOneWidget);
    });

    testWidgets('renders using customBuilder when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: Resource.loaded(MockPaginatedData(['A', 'B'], false)),
              hasInternalScroll: true,
              customBuilder: (context, items) => SliverToBoxAdapter(
                child: Column(
                  children: items.map((i) => Text('Custom $i')).toList(),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Custom A'), findsOneWidget);
      expect(find.text('Custom B'), findsOneWidget);
    });

    testWidgets('throws exception if neither itemBuilder nor customBuilder is provided', (tester) async {
      expect(
        () => PaginatedResourceBuilder<String, MockPaginatedData, String>(
          resource: const Resource.initial(),
        ),
        throwsException,
      );
    });

    testWidgets('renders loading state without skeletons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: const Resource.loading(),
              loading: const Text('Paginated Loading...'),
              itemBuilder: (context, index, item) => const SizedBox(),
            ),
          ),
        ),
      );

      expect(find.text('Paginated Loading...'), findsOneWidget);
    });

    testWidgets('renders skeletons when useSkeleton is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: const Resource.loading(),
              useSkeleton: true,
              initialData: ['S1', 'S2'],
              skeletonBuilder: (items) => MockPaginatedData(items, true),
              itemBuilder: (context, index, item) => Text('Skeleton $item'),
            ),
          ),
        ),
      );

      expect(find.text('Skeleton S1'), findsOneWidget);
      expect(find.text('Skeleton S2'), findsOneWidget);
    });

    testWidgets('renders pagination loader when gettingMore is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: Resource.gettingMore(MockPaginatedData(['A'], true)),
              paginationLoading: const Text('Loading more...'),
              onLoadMore: () {}, // Required to show the pagination section
              itemBuilder: (context, index, item) => Text('Item $item'),
            ),
          ),
        ),
      );

      expect(find.text('Item A'), findsOneWidget);
      expect(find.text('Loading more...'), findsOneWidget);
    });

    testWidgets('renders error state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: const Resource.error('List Error'),
              error: (context, error) => Text('Error: $error'),
              itemBuilder: (context, index, item) => const SizedBox(),
            ),
          ),
        ),
      );

      expect(find.text('Error: List Error'), findsOneWidget);
    });

    testWidgets('renders empty state when list is empty', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: Resource.loaded(MockPaginatedData([], false)),
              empty: const Text('No items found'),
              itemBuilder: (context, index, item) => const SizedBox(),
            ),
          ),
        ),
      );

      expect(find.text('No items found'), findsOneWidget);
    });

    testWidgets('triggers onLoadMore via PaginationTrigger', (tester) async {
      int loadMoreCount = 0;
      final scrollController = ScrollController();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 200, // Small viewport
              child: PaginatedResourceBuilder<String, MockPaginatedData, String>(
                resource: Resource.loaded(MockPaginatedData(['A', 'B', 'C', 'D'], true)),
                hasInternalScroll: true,
                controller: scrollController,
                onLoadMore: () => loadMoreCount++,
                paginationThreshold: 50,
                itemBuilder: (context, index, item) => SizedBox(
                  height: 100, // 4 items = 400px height + spacing
                  child: Text('Item $item'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(loadMoreCount, 0);

      scrollController.jumpTo(250);
      await tester.pumpAndSettle();

      expect(loadMoreCount, 1);
    });

    testWidgets('renders grid when gridDelegate is provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginatedResourceBuilder<String, MockPaginatedData, String>(
              resource: Resource.loaded(MockPaginatedData(['A'], false)),
              hasInternalScroll: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index, item) => Text('Grid $item'),
            ),
          ),
        ),
      );

      expect(find.byType(SliverGrid), findsOneWidget);
      expect(find.text('Grid A'), findsOneWidget);
    });

    testWidgets('renders pure sliver when hasInternalScroll is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                PaginatedResourceBuilder<String, MockPaginatedData, String>(
                  resource: Resource.loaded(MockPaginatedData(['A'], false)),
                  hasInternalScroll: false, // Pure sliver mode
                  itemBuilder: (context, index, item) => Text('Sliver $item'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.text('Sliver A'), findsOneWidget);
    });
  });
}
