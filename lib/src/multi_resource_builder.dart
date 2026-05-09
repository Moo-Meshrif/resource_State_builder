import 'package:flutter/material.dart';

import '../resource_state_builder.dart';

/// Base logic for multi-resource builders to avoid code duplication.
abstract class _MultiResourceBase<E> extends StatelessWidget {
  final List<Resource<dynamic, E>> aggregateResources;
  final Widget? loading;
  final Widget Function(BuildContext context, E error)? error;
  final Widget? empty;
  final VoidCallback? onRetry;
  final Future<void> Function()? onRefresh;

  /// The error to return if all resources fail.
  final E? globalError;

  const _MultiResourceBase({
    super.key,
    required this.aggregateResources,
    this.globalError,
    this.loading,
    this.error,
    this.empty,
    this.onRetry,
    this.onRefresh,
  });

  Widget buildInternal(BuildContext context, List<Widget> slivers) {
    final config = ResourceConfig.maybeOf<E>(context);
    final errorToUse = globalError ?? config?.defaultGlobalError;

    if (errorToUse == null) {
      throw FlutterError(
        'MultiResourceBuilder requires a globalError. '
        'Pass it via the constructor or provide a defaultGlobalError in ResourceConfig<$E>.',
      );
    }

    final aggregate = aggregateResources.toAggregate(null, errorToUse);
    final isLoading = aggregate.isLoading || aggregate.isRedirectLoading;

    // 1. Global Error
    if (!isLoading && aggregate.isError) {
      final err = aggregate.maybeMap(error: (e) => e.error, orElse: () => null);
      if (err != null) {
        return _scrollWrapper(
          context,
          SliverToBoxAdapter(
            child:
                error?.call(context, err as E) ??
                config?.errorBuilder?.call(context, err as E, onRetry) ??
                const SizedBox.shrink(),
          ),
        );
      }
    }

    // 2. Global Empty (All empty and not loading)
    if (!isLoading && aggregateResources.isAllEmpty) {
      return _scrollWrapper(
        context,
        SliverToBoxAdapter(
          child:
              empty ??
              config?.emptyBuilder?.call(context, onRetry) ??
              const SizedBox.shrink(),
        ),
      );
    }

    // 3. Success State (Slivers) or separate loading as skeleton if loading flag is true
    Widget result = CustomScrollView(slivers: slivers);

    if (onRefresh != null && aggregateResources.any((r) => r.data != null)) {
      result = RefreshIndicator(onRefresh: onRefresh!, child: result);
    }

    return result;
  }

  Widget _scrollWrapper(BuildContext context, Widget sliver) =>
      CustomScrollView(slivers: [sliver]);
}

/// A configuration defining how a standard [Resource] should be rendered
/// within a [MultiResourceBuilder].
class ResourceDef<T, E> {
  /// The resource state to render.
  final Resource<T, E> resource;

  /// The builder called when the resource is loaded successfully.
  final Widget Function(BuildContext context, T data) builder;

  /// Optional initial data used to generate a skeleton during the loading state.
  final T? initialData;

  /// Optional custom widget to display while loading.
  final Widget? loading;

  /// Optional custom widget to display when an error occurs.
  final Widget Function(BuildContext context, E error)? error;

  /// Optional custom widget to display when the resource is empty.
  final Widget? empty;

  /// Optional callback for a retry action.
  final VoidCallback? onRetry;

  ResourceDef({
    required this.resource,
    required this.builder,
    this.initialData,
    this.loading,
    this.error,
    this.empty,
    this.onRetry,
  });

  /// Converts this definition into a sliver widget.
  Widget toSliver([bool useSkeleton = true]) => ResourceBuilder<T, E>(
    resource: resource,
    builder: builder,
    initialData: initialData,
    useSliver: true,
    useSkeleton: useSkeleton,
    loading: loading,
    error: error,
    empty: empty,
    onRetry: onRetry,
  );
}

/// A configuration defining how a paginated [Resource] should be rendered
/// within a [MultiResourceBuilder].
///
/// This is used for lists of data that implement [PaginatedData].
class PaginatedResourceDef<T, P extends PaginatedData<T>, E> {
  /// The paginated resource state to render.
  final Resource<P, E> resource;

  /// The builder called for each item in the paginated list.
  final Widget Function(BuildContext context, int index, T item)? itemBuilder;

  /// An alternative custom builder if you need full control over the list rendering.
  final Widget Function(BuildContext context, List<T> items)? customBuilder;

  /// Optional initial items used to generate skeletons during the loading state.
  final List<T>? initialData;

  /// A function that creates a skeleton structure from [initialData] items.
  final P Function(List<T> items)? skeletonBuilder;

  /// Callback triggered when the list reaches the bottom to load more items.
  final VoidCallback? onLoadMore;

  /// Optional custom widget to display during the initial load.
  final Widget? loading;

  /// Optional custom widget to display at the bottom while fetching more items.
  final Widget? paginationLoading;

  /// Optional custom widget to display when an error occurs.
  final Widget Function(BuildContext context, E error)? error;

  /// Optional custom widget to display when the list is empty.
  final Widget? empty;

  /// Optional callback for a retry action.
  final VoidCallback? onRetry;

  /// The spacing between items in the list.
  final double spacing;

  PaginatedResourceDef({
    required this.resource,
    this.itemBuilder,
    this.customBuilder,
    this.initialData,
    this.skeletonBuilder,
    this.onLoadMore,
    this.loading,
    this.paginationLoading,
    this.error,
    this.empty,
    this.onRetry,
    this.spacing = 10,
  });

  /// Converts this definition into a sliver widget.
  Widget toSliver([bool useSkeleton = true]) =>
      PaginatedResourceBuilder<T, P, E>(
        resource: resource,
        itemBuilder: itemBuilder,
        customBuilder: customBuilder,
        initialData: initialData,
        skeletonBuilder: skeletonBuilder,
        onLoadMore: onLoadMore,
        hasInternalScroll: false,
        useSkeleton: useSkeleton,
        loading: loading,
        paginationLoading: paginationLoading,
        error: error,
        empty: empty,
        onRetry: onRetry,
        spacing: spacing,
      );
}

/// A powerful builder widget that coordinates multiple [Resource] states into a
/// single, unified view.
///
/// This builder acts as a composite screen orchestrator. It aggregates the
/// states of all provided resources to determine whether to show a global
/// full-page error, a global empty state, or allow the individual resources
/// to render their success/skeleton states.
///
/// All children are rendered as slivers within a single [CustomScrollView].
class MultiResourceBuilder<E> extends _MultiResourceBase<E> {
  /// A list of standard, non-paginated resources to render as slivers.
  final List<ResourceDef<dynamic, E>> standards;

  /// An optional paginated resource to render at the bottom of the list.
  final PaginatedResourceDef<dynamic, dynamic, E>? paginated;

  /// Whether to use skeletons (shimmer effect) when resources are in their
  /// initial loading state. If false, individual loading widgets are shown.
  final bool useSkeleton;

  MultiResourceBuilder({
    super.key,
    required this.standards,
    super.globalError,
    this.paginated,
    super.loading,
    super.error,
    super.empty,
    super.onRetry,
    super.onRefresh,
    this.useSkeleton = true,
  }) : super(
         aggregateResources: [
           ...standards.map((s) => s.resource),
           if (paginated != null) paginated.resource,
         ],
       );

  @override
  Widget build(BuildContext context) => buildInternal(context, [
    for (final s in standards) s.toSliver(useSkeleton),
    if (paginated != null) paginated!.toSliver(useSkeleton),
  ]);
}
