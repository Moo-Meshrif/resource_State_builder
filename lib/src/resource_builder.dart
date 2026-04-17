/// Visual layer for [Resource] handling.
/// Provides components to build UI specifically for single and paginated collections.
library;

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'resource_config.dart';
import 'resource_state.dart';
import 'resource_view_state.dart';

/// A widget that builds itself based on the state of a single [Resource].
///
/// It handles loading, error, empty, and data states automatically.
/// Useful for single data objects (e.g., user profile, settings).
class ResourceBuilder<T, E> extends StatelessWidget {
  /// The resource to monitor.
  final Resource<T, E> resource;

  /// The builder function that will be called when data is available.
  final Widget Function(BuildContext context, T data) builder;

  /// Optional custom loading widget.
  final Widget? loading;

  /// Optional custom error builder.
  final Widget Function(BuildContext context, E error)? error;

  /// Optional custom empty widget.
  final Widget? empty;

  /// Optional callback to retry fetching the resource.
  final VoidCallback? onRetry;

  /// Whether to use sliver.
  final bool useSliver;

  /// Sliver adapter to wrap the content if useSliver is true default is [SliverToBoxAdapter].
  final Widget Function(Widget child)? sliverAdapter;

  /// Whether to use [Skeletonizer] for the loading state.
  final bool useSkeleton;

  /// The initial data to use as a skeleton when [useSkeleton] is true.
  final T? initialData;

  const ResourceBuilder({
    super.key,
    required this.resource,
    required this.builder,
    this.loading,
    this.error,
    this.empty,
    this.onRetry,
    this.useSliver = false,
    this.sliverAdapter,
    this.useSkeleton = false,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    final config = ResourceConfig.maybeOf<E>(context);

    switch (resolveState(resource)) {
      case ResourceViewState.loading:
      case ResourceViewState.redirectLoading:
        if (resource.isLoading && useSkeleton && initialData != null) {
          final child = builder(context, initialData as T);
          return useSliver
              ? Skeletonizer.sliver(enabled: true, child: child)
              : Skeletonizer(enabled: true, child: child);
        }

        return _adapter(
          loading ??
              config?.loadingBuilder?.call(context) ??
              const Center(child: CircularProgressIndicator()),
        );

      case ResourceViewState.error:
        final err = resource.error;
        if (err == null) return _adapter(const SizedBox.shrink());

        return _adapter(
          error?.call(context, err) ??
              config?.errorBuilder?.call(context, err, onRetry) ??
              const SizedBox.shrink(),
        );

      case ResourceViewState.empty:
        return _adapter(
          empty ??
              config?.emptyBuilder?.call(context, onRetry) ??
              const SizedBox.shrink(),
        );

      case ResourceViewState.data:
        return builder(context, resource.data as T);
    }
  }

  Widget _adapter(Widget child) => useSliver
      ? sliverAdapter?.call(child) ?? SliverToBoxAdapter(child: child)
      : child;
}
