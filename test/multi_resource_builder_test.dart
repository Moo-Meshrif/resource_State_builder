import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource_state_builder/resource_state_builder.dart';

/// A simple mock selector that mimics a state management selector
/// by using a ValueListenable and only rebuilding when the selected
/// value changes.
class MockSelector<S, T> extends StatefulWidget {
  final ValueNotifier<S> valueListenable;
  final T Function(S) selector;
  final Widget Function(BuildContext context, T value) builder;

  const MockSelector({
    super.key,
    required this.valueListenable,
    required this.selector,
    required this.builder,
  });

  @override
  State<MockSelector<S, T>> createState() => _MockSelectorState<S, T>();
}

class _MockSelectorState<S, T> extends State<MockSelector<S, T>> {
  late T _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selector(widget.valueListenable.value);
    widget.valueListenable.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant MockSelector<S, T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(_listener);
      widget.valueListenable.addListener(_listener);
    }
  }

  void _listener() {
    final newSelected = widget.selector(widget.valueListenable.value);
    if (newSelected != _selected) {
      setState(() {
        _selected = newSelected;
      });
    }
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _selected);
  }
}

void main() {
  group('MultiResourceBuilder with selectorBuilder', () {
    testWidgets(
      'only rebuilds the resource whose selector fires, siblings stay cached',
      (tester) async {
        var userBuildCount = 0;
        var orderBuildCount = 0;

        // Simulate a state holder with a ValueNotifier
        final stateNotifier =
            ValueNotifier<
              ({
                Resource<String, String> userResource,
                Resource<String, String> orderResource,
              })
            >((
              userResource: const Resource.loaded('Alice'),
              orderResource: const Resource.loaded('Order-1'),
            ));

        await tester.pumpWidget(
          MaterialApp(
            home: ResourceConfig<String>(
              defaultGlobalError: 'global error',
              errorBuilder: (ctx, err, retry) => Text('Error: $err'),
              emptyBuilder: (ctx, retry) => const Text('Empty'),
              child: MultiResourceBuilder<String>(
                globalError: 'global error',
                resourcesSelector: (b) => Builder(builder: (ctx) => b(ctx, [])),
                standards: [
                  ResourceDef<String, String>(
                    resource: stateNotifier.value.userResource,
                    selectorBuilder: (childBuilder) =>
                        MockSelector<
                          ({
                            Resource<String, String> userResource,
                            Resource<String, String> orderResource,
                          }),
                          Resource<String, String>
                        >(
                          valueListenable: stateNotifier,
                          selector: (s) => s.userResource,
                          builder: childBuilder,
                        ),
                    builder: (context, data) {
                      userBuildCount++;
                      return SliverToBoxAdapter(child: Text('user: $data'));
                    },
                  ),
                  ResourceDef<String, String>(
                    resource: stateNotifier.value.orderResource,
                    selectorBuilder: (childBuilder) =>
                        MockSelector<
                          ({
                            Resource<String, String> userResource,
                            Resource<String, String> orderResource,
                          }),
                          Resource<String, String>
                        >(
                          valueListenable: stateNotifier,
                          selector: (s) => s.orderResource,
                          builder: childBuilder,
                        ),
                    builder: (context, data) {
                      orderBuildCount++;
                      return SliverToBoxAdapter(child: Text('order: $data'));
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        expect(userBuildCount, 1);
        expect(orderBuildCount, 1);
        expect(find.text('user: Alice'), findsOneWidget);
        expect(find.text('order: Order-1'), findsOneWidget);

        // Only orderResource changes
        stateNotifier.value = (
          userResource: const Resource.loaded('Alice'), // same
          orderResource: const Resource.loaded('Order-2'), // changed
        );
        await tester.pumpAndSettle();

        expect(userBuildCount, 1); // NOT rebuilt — selector skips
        expect(orderBuildCount, 2); // rebuilt — resource changed
        expect(find.text('user: Alice'), findsOneWidget);
        expect(find.text('order: Order-2'), findsOneWidget);

        // Only userResource changes
        stateNotifier.value = (
          userResource: const Resource.loaded('Bob'), // changed
          orderResource: const Resource.loaded('Order-2'), // same
        );
        await tester.pumpAndSettle();

        expect(userBuildCount, 2); // rebuilt
        expect(orderBuildCount, 2); // NOT rebuilt — selector skips
        expect(find.text('user: Bob'), findsOneWidget);
        expect(find.text('order: Order-2'), findsOneWidget);

        stateNotifier.dispose();
      },
    );

    testWidgets('works without selectorBuilder (direct resource)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<String>(
            defaultGlobalError: 'global error',
            errorBuilder: (ctx, err, retry) => Text('Error: $err'),
            emptyBuilder: (ctx, retry) => const Text('Empty'),
            child: MultiResourceBuilder<String>(
              globalError: 'global error',
              standards: [
                ResourceDef<String, String>(
                  resource: const Resource.loaded('hello'),
                  builder: (context, data) =>
                      SliverToBoxAdapter(child: Text('data: $data')),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('data: hello'), findsOneWidget);
    });

    testWidgets('neither rebuilds when nothing changes', (tester) async {
      var userBuildCount = 0;
      var orderBuildCount = 0;

      final stateNotifier =
          ValueNotifier<
            ({
              Resource<String, String> userResource,
              Resource<String, String> orderResource,
            })
          >((
            userResource: const Resource.loaded('Alice'),
            orderResource: const Resource.loaded('Order-1'),
          ));

      await tester.pumpWidget(
        MaterialApp(
          home: ResourceConfig<String>(
            defaultGlobalError: 'global error',
            errorBuilder: (ctx, err, retry) => Text('Error: $err'),
            emptyBuilder: (ctx, retry) => const Text('Empty'),
            child: MultiResourceBuilder<String>(
              globalError: 'global error',
              resourcesSelector: (b) => Builder(builder: (ctx) => b(ctx, [])),
              standards: [
                ResourceDef<String, String>(
                  resource: stateNotifier.value.userResource,
                  selectorBuilder: (childBuilder) =>
                      MockSelector<
                        ({
                          Resource<String, String> userResource,
                          Resource<String, String> orderResource,
                        }),
                        Resource<String, String>
                      >(
                        valueListenable: stateNotifier,
                        selector: (s) => s.userResource,
                        builder: childBuilder,
                      ),
                  builder: (context, data) {
                    userBuildCount++;
                    return SliverToBoxAdapter(child: Text('user: $data'));
                  },
                ),
                ResourceDef<String, String>(
                  resource: stateNotifier.value.orderResource,
                  selectorBuilder: (childBuilder) =>
                      MockSelector<
                        ({
                          Resource<String, String> userResource,
                          Resource<String, String> orderResource,
                        }),
                        Resource<String, String>
                      >(
                        valueListenable: stateNotifier,
                        selector: (s) => s.orderResource,
                        builder: childBuilder,
                      ),
                  builder: (context, data) {
                    orderBuildCount++;
                    return SliverToBoxAdapter(child: Text('order: $data'));
                  },
                ),
              ],
            ),
          ),
        ),
      );

      expect(userBuildCount, 1);
      expect(orderBuildCount, 1);

      // Set same values — neither should rebuild
      stateNotifier.value = (
        userResource: const Resource.loaded('Alice'),
        orderResource: const Resource.loaded('Order-1'),
      );
      await tester.pumpAndSettle();

      expect(userBuildCount, 1);
      expect(orderBuildCount, 1);

      stateNotifier.dispose();
    });

    testWidgets(
      'works when resource is omitted and relies solely on selectorBuilder',
      (tester) async {
        var userBuildCount = 0;

        final stateNotifier = ValueNotifier<Resource<String, String>>(
          const Resource.loaded('Alice'),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: ResourceConfig<String>(
              defaultGlobalError: 'global error',
              errorBuilder: (ctx, err, retry) => Text('Error: $err'),
              emptyBuilder: (ctx, retry) => const Text('Empty'),
              child: MultiResourceBuilder<String>(
                globalError: 'global error',
                resourcesSelector: (b) => Builder(builder: (ctx) => b(ctx, [])),
                standards: [
                  ResourceDef<String, String>(
                    // resource is OMITTED
                    selectorBuilder: (childBuilder) =>
                        MockSelector<
                          Resource<String, String>,
                          Resource<String, String>
                        >(
                          valueListenable: stateNotifier,
                          selector: (s) => s,
                          builder: childBuilder,
                        ),
                    builder: (context, data) {
                      userBuildCount++;
                      return SliverToBoxAdapter(child: Text('user: $data'));
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        expect(userBuildCount, 1);
        expect(find.text('user: Alice'), findsOneWidget);

        // Change state
        stateNotifier.value = const Resource.loaded('Bob');
        await tester.pumpAndSettle();

        expect(userBuildCount, 2);
        expect(find.text('user: Bob'), findsOneWidget);

        stateNotifier.dispose();
      },
    );

    group('MultiResourceBuilder state aggregation and paginated resources', () {
      testWidgets('renders paginated resource correctly inside MultiResourceBuilder', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MultiResourceBuilder<String>(
                globalError: 'GlobalErr',
                resourcesSelector: (b) => Builder(builder: (ctx) => b(ctx, [])),
                standards: [
                  ResourceDef<String, String>(
                    resource: const Resource.loaded('A'),
                    builder: (context, data) => SliverToBoxAdapter(child: Text('Standard $data')),
                  )
                ],
                paginated: PaginatedResourceDef<String, PaginatedData<String>, String>(
                  resource: const Resource.loaded(_MockPaginated(['P1', 'P2'])),
                  itemBuilder: (context, index, item) => Text('Paginated $item'),
                  selectorBuilder: (childBuilder) => Builder(
                    builder: (ctx) => childBuilder(ctx, const Resource.loaded(_MockPaginated(['P1', 'P2']))),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Standard A'), findsOneWidget);
        expect(find.text('Paginated P1'), findsOneWidget);
        expect(find.text('Paginated P2'), findsOneWidget);
      });

      testWidgets('renders global error when resources have error', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MultiResourceBuilder<String>(
                globalError: 'GlobalErr',
                error: (context, err) => Text(err),
                standards: [
                  ResourceDef<String, String>(
                    resource: const Resource.error('E1'),
                    builder: (context, data) => SliverToBoxAdapter(child: Text('A')),
                  )
                ],
                paginated: PaginatedResourceDef<String, PaginatedData<String>, String>(
                  resource: const Resource.error('E2'),
                  itemBuilder: (context, index, item) => Text('B'),
                ),
              ),
            ),
          ),
        );

        // Global error renders
        expect(find.text('GlobalErr'), findsOneWidget);
      });

      testWidgets('renders global empty when all resources are empty', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ResourceConfig<String>(
                emptyBuilder: (ctx, retry) => const Text('Global Empty'),
                child: MultiResourceBuilder<String>(
                  globalError: 'GlobalErr',
                  standards: [
                    ResourceDef<String, String>(
                      resource: const Resource.initial(),
                      builder: (context, data) => SliverToBoxAdapter(child: Text('A')),
                    )
                  ],
                  paginated: PaginatedResourceDef<String, PaginatedData<String>, String>(
                    resource: const Resource.initial(),
                    itemBuilder: (context, index, item) => Text('B'),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Global Empty'), findsOneWidget);
      });

      testWidgets('RefreshIndicator is rendered when onRefresh is provided', (tester) async {
        int refreshCount = 0;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MultiResourceBuilder<String>(
                globalError: 'GlobalErr',
                onRefresh: () async => refreshCount++,
                standards: [
                  ResourceDef<String, String>(
                    resource: const Resource.loaded('A'),
                    builder: (context, data) => SliverToBoxAdapter(child: SizedBox(height: 1000, child: Text('Standard $data'))),
                  )
                ],
              ),
            ),
          ),
        );

        // Swipe down to refresh
        await tester.drag(find.text('Standard A'), const Offset(0, 300));
        await tester.pumpAndSettle();

        expect(refreshCount, 1);
      });

      testWidgets('PaginatedResourceDef without selectorBuilder', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MultiResourceBuilder<String>(
                globalError: 'GlobalErr',
                standards: const [],
                paginated: PaginatedResourceDef<String, PaginatedData<String>, String>(
                  resource: const Resource.loaded(_MockPaginated(['P1'])),
                  itemBuilder: (context, index, item) => Text('Paginated $item'),
                ),
              ),
            ),
          ),
        );
        expect(find.text('Paginated P1'), findsOneWidget);
      });
    });
  });
}

class _MockPaginated implements PaginatedData<String> {
  @override
  final List<String> items;
  @override
  bool get hasMore => false;
  const _MockPaginated(this.items);
}
