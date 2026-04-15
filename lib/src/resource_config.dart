import 'package:flutter/widgets.dart';

/// Global configuration for [ResourceBuilder] and [PaginatedResourceBuilder].
///
/// Allows defining default widgets for loading, empty, and error states.
class ResourceConfig<E> extends InheritedWidget {
  const ResourceConfig({
    super.key,
    required super.child,
    this.loadingBuilder,
    this.paginationLoadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
  });

  /// Default builder for the loading state.
  final WidgetBuilder? loadingBuilder;

  /// Default builder for the pagination loading indicator.
  final WidgetBuilder? paginationLoadingBuilder;

  /// Default builder for the empty state.
  final Widget Function(BuildContext context, VoidCallback? onRetry)?
  emptyBuilder;

  /// Default builder for the error state.
  final Widget Function(BuildContext context, E error, VoidCallback? onRetry)?
  errorBuilder;

  /// Retrieves the [ResourceConfig] from the nearest [InheritedWidget] of this type.
  static ResourceConfig<E>? maybeOf<E>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResourceConfig<E>>();
  }

  /// Retrieves the [ResourceConfig] from the nearest [InheritedWidget] of this type.
  /// Throws if not found.
  static ResourceConfig<E> of<E>(BuildContext context) {
    final result = maybeOf<E>(context);
    return result!;
  }

  @override
  bool updateShouldNotify(ResourceConfig<E> oldWidget) {
    return loadingBuilder != oldWidget.loadingBuilder ||
        paginationLoadingBuilder != oldWidget.paginationLoadingBuilder ||
        emptyBuilder != oldWidget.emptyBuilder ||
        errorBuilder != oldWidget.errorBuilder;
  }
}
