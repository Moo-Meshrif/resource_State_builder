import 'package:flutter/widgets.dart';

/// Global configuration for [ResourceBuilder] and [PaginatedResourceBuilder].
///
/// Allows defining default widgets for loading, empty, and error states.
///
/// `ResourceConfig` widgets can be nested. A child config only needs to supply
/// the builders it wants to override; any builder left `null` is **inherited**
/// from the nearest ancestor `ResourceConfig<E>` automatically.
///
/// ```dart
/// ResourceConfig<AppError>(
///   errorBuilder: (ctx, err, retry) => GlobalErrorWidget(err, retry),
///   child: ResourceConfig<AppError>(
///     // overrides only emptyBuilder; error still uses the ancestor's widget
///     emptyBuilder: (ctx, retry) => PageSpecificEmpty(retry),
///     child: MyPage(),
///   ),
/// )
/// ```
class ResourceConfig<E> extends InheritedWidget {
  const ResourceConfig({
    super.key,
    required super.child,
    this.loadingBuilder,
    this.paginationLoadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.defaultGlobalError,
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

  /// Default error to use in [MultiResourceBuilder] if all resources fail.
  final E? defaultGlobalError;

  /// Returns a view of this config with any null builders filled in from the
  /// nearest ancestor [ResourceConfig<E>].
  ///
  /// This is used internally by builders so that a nested config only needs to
  /// declare the fields it wants to override.
  ResourceConfig<E> _mergedWith(ResourceConfig<E>? ancestor) {
    if (ancestor == null) return this;
    return _MergedResourceConfig(this, ancestor, child: child);
  }

  /// Retrieves the [ResourceConfig] from the nearest ancestor, already merged
  /// with any further-ancestor configs so callers get the fully-resolved view.
  static ResourceConfig<E>? maybeOf<E>(BuildContext context) {
    // Walk the element tree to collect both this node and its ancestor so we
    // can merge them.  dependOnInheritedWidgetOfExactType already does the
    // right thing for rebuild subscriptions.
    final nearest = context
        .dependOnInheritedWidgetOfExactType<ResourceConfig<E>>();
    if (nearest == null) return null;

    // Look for a further ancestor to merge with.
    final ancestor = _ancestorOf<E>(context, nearest);
    return nearest._mergedWith(ancestor);
  }

  /// Retrieves the [ResourceConfig] from the nearest ancestor.
  /// Throws if not found.
  static ResourceConfig<E> of<E>(BuildContext context) {
    final result = maybeOf<E>(context);
    assert(result != null, 'No ResourceConfig<$E> found in the widget tree.');
    return result!;
  }

  /// Finds the next ancestor [ResourceConfig<E>] above [below].
  static ResourceConfig<E>? _ancestorOf<E>(
    BuildContext context,
    ResourceConfig<E> below,
  ) {
    ResourceConfig<E>? result;
    context.visitAncestorElements((element) {
      if (element.widget == below) return true; // skip self
      if (element.widget is ResourceConfig<E>) {
        result = element.widget as ResourceConfig<E>;
        return false; // stop
      }
      return true;
    });
    return result;
  }

  @override
  bool updateShouldNotify(ResourceConfig<E> oldWidget) {
    return loadingBuilder != oldWidget.loadingBuilder ||
        paginationLoadingBuilder != oldWidget.paginationLoadingBuilder ||
        emptyBuilder != oldWidget.emptyBuilder ||
        errorBuilder != oldWidget.errorBuilder ||
        defaultGlobalError != oldWidget.defaultGlobalError;
  }
}

/// Internal merged view — combines a child config with an ancestor.
/// Null fields in [config] fall back to [ancestor].
class _MergedResourceConfig<E> extends ResourceConfig<E> {
  _MergedResourceConfig(
    ResourceConfig<E> config,
    ResourceConfig<E> ancestor, {
    required super.child,
  }) : super(
         loadingBuilder: config.loadingBuilder ?? ancestor.loadingBuilder,
         paginationLoadingBuilder:
             config.paginationLoadingBuilder ??
             ancestor.paginationLoadingBuilder,
         emptyBuilder: config.emptyBuilder ?? ancestor.emptyBuilder,
         errorBuilder: config.errorBuilder ?? ancestor.errorBuilder,
         defaultGlobalError:
             config.defaultGlobalError ?? ancestor.defaultGlobalError,
       );
}
