# Changelog

All notable changes to this project will be documented in this file.

## [0.0.6]

### Added
- **Agnostic Selective Rebuilds**: Introduced the `selectorBuilder` parameter in `ResourceDef` and `PaginatedResourceDef`. Wrap individual slivers in any native state management selector (like `BlocSelector`) to prevent unnecessary full-screen rebuilds.
- **Flexible Global Aggregation**: The `resource` parameter is now optional. Developers can rely solely on `selectorBuilder` to build high-performance independent sections, bypassing global state aggregation entirely when desired.

## [0.0.5]

### Added
- **MultiResourceBuilder**: Implemented composite architecture with `ResourceDef` and `PaginatedResourceDef` for robust multi-resource screens.
- **Resource State**: Added new extension methods `toGettingMore()`/`toPopUpLoading()` for easier state transitions.
- **Pagination Helpers**: New data manipulation methods for paginated resources: `appendItems`, `prependItems`, `updateWhere`, `replaceWhere`, and `insertAt`.
- **Resource Config**: Implemented inheritance/merging for nested `ResourceConfig` widgets, allowing partial overrides.
- **Paginated Resource Builder**: Added support for horizontal scroll direction and grid layouts via `scrollDirection` and `gridDelegate`.

### Fixed
- **ResourceAggregator**: Improved logic to use strict (All) resolution for `toAggregate`.

## [0.0.4]

### Fixed
- Updated `resource_state_builder` dependency from ^0.0.2 to ^0.0.4 in `README.md`.

## [0.0.3]

### Added
- Unified `copyWithData` and `copyWithError` into a single, idiomatic `copyWith` method in `ResourceExtension`.
- Comprehensive API documentation in `README.md` for all extension helpers (`ResourceExtension`, `ResourcePaginatedX`, and `ResourceAggregator`).
- Detailed code examples for Logic Layer Integration and Advanced Patterns moved to the primary documentation section.

## [0.0.2] 

### Fixed

-   Added missing dependency: `resource_state_builder`
-   Resolved issue where consumers had to manually include the
    dependency
-   Upgraded dependencies to their latest major versions

## \[0.0.1\] 

### Added

-   Initial release
-   Generic implementation of resource states and UI builders for both
    paginated and standard resources
-   Support for `ResourceBuilder` and `PaginatedResourceBuilder`
-   Global configuration support via `ResourceConfig`

