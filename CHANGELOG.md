# Changelog

All notable changes to this project will be documented in this file.

------------------------------------------------------------------------

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

