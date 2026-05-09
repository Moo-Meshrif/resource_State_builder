import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'pagination.dart';
import 'pagination_trigger.dart';
import 'resource_builder.dart';
import 'resource_config.dart';
import 'resource_state.dart';

// =============================================================================

/// Use the [PaginatedResourceBuilder] with `hasInternalScroll: false` to get
/// a pure sliver that can be embedded directly inside an existing
/// [CustomScrollView].
///
/// Pass [scrollDirection] for horizontal lists. Pass [gridDelegate] to switch
/// from [SliverList] to [SliverGrid].
class PaginatedResourceBuilder<T, P extends PaginatedData<T>, E>
    extends StatelessWidget {
  /// The paginated resource to monitor (infinite scrolling).
  final Resource<P, E> resource;

  /// The builder function for individual list items.
  final Widget Function(BuildContext context, int index, T item)? itemBuilder;

  /// Optional custom builder for the list items.
  final Widget Function(BuildContext context, List<T> items)? customBuilder;

  /// Optional custom loading widget.
  final Widget? loading;

  /// Optional custom pagination loading indicator.
  final Widget? paginationLoading;

  /// Optional custom error builder.
  final Widget Function(BuildContext context, E error)? error;

  /// Optional custom empty widget.
  final Widget? empty;

  /// Optional callback to retry fetching the initial resource.
  final VoidCallback? onRetry;

  /// Optional callback to fetch more data when reaching the end of the list.
  final VoidCallback? onLoadMore;

  /// Optional callback for pull-to-refresh functionality.
  /// Only works if [hasInternalScroll] is true. Otherwise, wrap the outer scroll view in a [RefreshIndicator].
  final Future<void> Function()? onRefresh;

  /// Optional custom builder for the refresh indicator (e.g., [RefreshIndicator]).
  final Widget Function(
    BuildContext context,
    Future<void> Function() onRefresh,
    Widget child,
  )?
  refreshBuilder;

  /// The vertical spacing between all elements in the layout.
  final double spacing;

  /// Whether to use [Skeletonizer] for the loading state.
  final bool useSkeleton;

  /// The initial items to use as a skeleton when [useSkeleton] is true.
  final List<T>? initialData;

  /// Builds a pagination wrapper around [initialData] for skeleton mode.
  final P Function(List<T> items)? skeletonBuilder;

  /// The distance from the bottom of the list at which [onLoadMore] is triggered.
  final double paginationThreshold;

  /// Optional scroll controller for the internal [CustomScrollView].
  final ScrollController? controller;

  /// Optional physics for the internal [CustomScrollView].
  final ScrollPhysics? physics;

  /// Whether the internal scroll view should be rendered in reverse.
  final bool reverse;

  /// Whether the internal scroll view should shrink-wrap its content.
  final bool shrinkWrap;

  /// Whether the internal scroll view should be wrapped in a [CustomScrollView].
  final bool hasInternalScroll;

  /// The scroll direction of the list or grid. Defaults to [Axis.vertical].
  final Axis scrollDirection;

  /// When set, renders a [SliverGrid] instead of [SliverList].
  final SliverGridDelegate? gridDelegate;

  /// Standard constructor — renders its own [CustomScrollView].
  PaginatedResourceBuilder({
    super.key,
    required this.resource,
    this.itemBuilder,
    this.customBuilder,
    this.loading,
    this.paginationLoading,
    this.error,
    this.empty,
    this.onRetry,
    this.onLoadMore,
    this.onRefresh,
    this.refreshBuilder,
    this.spacing = 10,
    this.paginationThreshold = 200,
    this.useSkeleton = false,
    this.initialData,
    this.skeletonBuilder,
    this.controller,
    this.physics,
    this.reverse = false,
    this.shrinkWrap = false,
    this.hasInternalScroll = true,
    this.scrollDirection = Axis.vertical,
    this.gridDelegate,
  }) {
    if (itemBuilder == null && customBuilder == null) {
      throw Exception('itemBuilder or customBuilder must be provided');
    }
  }


  ScrollPhysics? get _scrollPhysics {
    if (physics != null) return physics;
    if (onRefresh != null) return const AlwaysScrollableScrollPhysics();
    return const ClampingScrollPhysics();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _buildContent(context);

    if (hasInternalScroll) {
      content = CustomScrollView(
        controller: controller,
        physics: _scrollPhysics,
        reverse: reverse,
        shrinkWrap: shrinkWrap,
        scrollDirection: scrollDirection,
        slivers: [content],
      );
    }

    if (onRefresh != null && hasInternalScroll && resource.data != null) {
      content =
          refreshBuilder?.call(context, onRefresh!, content) ??
          RefreshIndicator(onRefresh: onRefresh!, child: content);
    }

    return content;
  }

  /// Builds the main content of the widget.
  Widget _buildContent(BuildContext context) => SliverMainAxisGroup(
    slivers: [
      ResourceBuilder<P, E>(
        resource: resource,
        useSliver: true,
        useSkeleton: useSkeleton,
        empty: empty,
        error: error,
        loading: loading,
        onRetry: onRetry,
        initialData: initialData != null && skeletonBuilder != null
            ? skeletonBuilder!(initialData!)
            : null,
        sliverAdapter: (child) => SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: child),
        ),
        builder: (context, data) {
          final items = data.items;

          if (customBuilder != null) {
            return customBuilder!(context, items);
          }

          if (gridDelegate != null) {
            return SliverGrid(
              gridDelegate: gridDelegate!,
              delegate: SliverChildBuilderDelegate(
                (c, i) => itemBuilder!(c, i, items[i]),
                childCount: items.length,
              ),
            );
          }

          return SliverList.separated(
            itemCount: items.length,
            itemBuilder: (c, i) => itemBuilder!(c, i, items[i]),
            separatorBuilder: (c, i) => scrollDirection == Axis.horizontal
                ? SizedBox(width: spacing)
                : SizedBox(height: spacing),
          );
        },
      ),
      if (resource.data != null && onLoadMore != null)
        SliverPadding(
          padding: scrollDirection == Axis.horizontal
              ? EdgeInsets.symmetric(horizontal: spacing)
              : EdgeInsets.symmetric(vertical: spacing),
          sliver: SliverToBoxAdapter(child: _buildPaginationIndicator(context)),
        ),
    ],
  );

  /// Builds the pagination indicator.
  Widget _buildPaginationIndicator(BuildContext context) {
    final currentData = resource.data;
    final config = ResourceConfig.maybeOf<E>(context);

    if (resource.isGettingMore) {
      if (useSkeleton && initialData != null && initialData!.isNotEmpty) {
        return Skeletonizer(
          enabled: true,
          child: customBuilder != null
              ? customBuilder!(context, initialData!)
              : itemBuilder!(context, 0, initialData!.first),
        );
      }

      return paginationLoading ??
          config?.paginationLoadingBuilder?.call(context) ??
          loading ??
          config?.loadingBuilder?.call(context) ??
          const Center(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),
          );
    }

    if (currentData == null || !currentData.hasMore || onLoadMore == null) {
      return const SizedBox.shrink();
    }

    return PaginationTrigger(
      onTrigger: onLoadMore!,
      threshold: paginationThreshold,
    );
  }
}
