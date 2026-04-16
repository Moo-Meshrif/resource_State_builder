# 📦 Resource State Builder

A robust, type-safe framework for managing data synchronization and UI states in Flutter. This system eliminates boilerplate code for loading, error, and pagination states while ensuring a premium user experience through built-in support for **Skeletonizer** and **Slivers**.

---

## 🏗 Philosophy
Modern mobile apps shouldn't just show a spinner. This system encourages:
-   **Seamless Transitions**: Retaining old data while fetching new data (`updating` state).
-   **Rich Feedback**: Professional-grade placeholders for empty and error states via global configuration.
-   **Type Safety**: Leveraging sealed classes to ensure every state is handled correctly.
-   **Performance**: Efficient rendering using slivers for complex lists and custom scroll views.

---

## 📋 Table of Contents
1. [Installation](#-installation)
2. [Core Components](#-core-components)
3. [Required User Models](#-required-user-models)
4. [State Definitions](#-state-definitions)
5. [Extensions & Helpers (Logic & Advanced Patterns)](#-extensions--helpers-logic--advanced-patterns)
6. [ResourceConfig (Global Configuration)](#-resourceconfig-global-configuration)
7. [ResourceBuilder (Single Objects)](#-resourcebuilder-single-objects)
8. [PaginatedResourceBuilder (Collections)](#-paginatedresourcebuilder-collections)
9. [Example](#-example)

---

## 🚀 Installation

Add the package to your `pubspec.yaml` (using your local path or git URL):

```yaml
dependencies:
  resource_state_builder: ^0.0.2
```

---

## 📂 Core Components

| File | Purpose | Key Responsibility |
| :--- | :--- | :--- |
| `resource_state.dart` | **Model** | Defines the state machine and data containers (`Resource<T, E>`). |
| `pagination.dart` | **Interfaces** | Defines the `PaginatedData` contract and list manipulation helpers. |
| `resource_config.dart` | **Configuration** | Global InheritedWidget to define app-wide loading, error, and empty builders. |
| `resource_builder.dart` | **Widgets** | Primary UI builders for both single and paginated resources. |

---

## 👤 Required User Models

To get the most out of this package, you should implement these models in your project (typically in the **Domain** or **Data** layer).

### 1. Error Model (e.g., `Failure`)
Instead of using simple strings, use a structured model to represent errors. 
```dart
class Failure {
  final String message;
  final int? code;
  Failure(this.message, {this.code});
}
```

### 2. Paginated Data Model
Your API response models for lists must implement `PaginatedData<T>`.
```dart
class ProductPage implements PaginatedData<Product> {
  final List<Product> products;
  final bool hasMoreData;

  @override
  List<Product> get items => products;

  @override
  bool get hasMore => hasMoreData;

  ProductPage({required this.products, required this.hasMoreData});
}
```

---

## 💎 State Definitions

The `Resource<T, E>` model defines the exact lifecycle of your data.

| Factory | Meaning | Visual Effect |
| :--- | :--- | :--- |
| `.initial()` | Idle | No UI changes or static placeholder. |
| `.loading()` | First-load | Shows `loading` widget, global `loadingBuilder`, or `Skeletonizer`. |
| `.popUpLoading()` | Global | Usually triggers an overlay spinner/dialog. |
| `.redirectLoading()`| Recovery | Shifting from error back to loading state. |
| `.updating(T? data)` | Refresh | Data is visible; background loader may show. |
| `.gettingMore(T? data)`| Pagination | Keeping existing list; adding footer loader. |
| `.loaded(T data)` | Success | Renders final data via the `builder`. |
| `.error(E error)` | Failed | Renders local `error` builder or global `errorBuilder`. |

---

## ✨ Extensions & Helpers (Logic & Advanced Patterns)

The package provides several helper extensions to make your logic and UI code more expressive and manageable.

### 1. ResourceExtension
Available on any `Resource<T, E>`. These helpers allow you to inspect and modify states without verbose pattern matching.

#### 🔍 State Checks (Getters)
- `isInitial`: True if no action has been taken yet.
- `isLoading`: True during the very first data fetch.
- `isPopUpLoading`: True when a global/blocking loader is active.
- `isRedirectLoading`: True when recovering from an error or manually triggering a full reload.
- `isUpdating`: True during background refreshes (retains existing data).
- `isGettingMore`: True during pagination/scrolling for more items.
- `isLoaded`: True when data is successfully fetched and ready.
- `isError`: True when the operation failed with a domain error.

#### 📦 Data Extraction (Getters)
- `data`: Safely extracts `T?`. It returns the current data if the state is `loaded`, `updating`, or `gettingMore`, and `null` otherwise.
- `error`: Safely extracts the domain error `E?` from the `error` state.
- `successMessage`: Extracts an optional message (e.g., "Profile updated") from the `loaded` state.

#### ⚙️ Logic Integration (`toLoading` & `copyWith`)
- `toLoading({bool refresh, bool redirect})`: Converts the state into a loading variant.
- `copyWith({T? data, E? error})`: Safely updates data or error while maintaining state type.

**Example Usage:**
```dart
Resource<User, Failure> user = const Resource.initial();

// Transition to loading while keeping old data if exists
user = user.toLoading(refresh: true); 

// Recovery: use redirect when retrying from an error (required if data is null)
user = user.toLoading(redirect: true); 

// Successful update
user = Resource.loaded(userFromServer);

// Safe data update within valid states
user = user.copyWith(data: updatedUser);
```

### 2. ResourcePaginatedX
Specialized helpers for resources containing list-based data that implements `PaginatedData`.

- `removeWhere(test, rebuild)`: Enables **Optimistic UI Updates**. It filters the current list items based on a predicate and packages the result into your custom model.

**Example Usage:**
```dart
// Remove an item locally without a full API refresh
resource.removeWhere(
  (item) => item.id == deletedId,
  (newItems, current) => current.copyWith(items: newItems),
);
```

### 3. ResourceAggregator
Available on `Iterable<Resource>`. Useful for composite screens that depend on multiple concurrent API calls.

- `isAnyLoading`: Returns true if ANY tracked resource is in a `redirectLoading` state.
- `hasError`: Returns true if ANY resource has failed.
- `toAggregate<T, E>(T value)`: Combines the status of multiple resources into one.

**Example Usage:**
```dart
// Combine multiple resources into one aggregate state
final resources = [state.profile, state.orders];
final combinedStatus = resources.toAggregate(myData); 

ResourceBuilder(
  resource: combinedStatus,
  builder: (context, _) => MainDashboard(
    user: state.profile.data!,
    orders: state.orders.data!,
  ),
)
```

---

## ⚙️ ResourceConfig (Global Configuration)

Instead of passing error and loading widgets to every builder, define them once at the root of your app using your custom error model.

```dart
ResourceConfig<Failure>(
  loadingBuilder: (context) => const MyGlobalSpinner(),
  paginationLoadingBuilder: (context) => const MyPaginationSpinner(),
  emptyBuilder: (context, onRetry) => const MyEmptyState(onRetry: onRetry),
  errorBuilder: (context, failure, onRetry) => MyErrorWidget(
    message: failure.message,
    onRetry: onRetry,
  ),
  child: MaterialApp(...),
)
```

---

## 🛠 ResourceBuilder (Single Objects)

Used when you are fetching a single entity (e.g., a specific `User` or `ProductDetail`).

### Generics
| Type | Description |
| :--- | :--- |
| `T` | The type of the data object being handled. |
| `E` | The type of the error object (e.g., `Failure`). |

### Properties
| Property | Type | Description |
| :--- | :--- | :--- |
| `resource` | `Resource<T, E>` | The source of truth (model). |
| `builder` | `Widget Function(BuildContext, T data)` | Builds the success UI. |
| `loading` | `Widget?` | Local custom loading widget (overrides global). |
| `error` | `Widget Function(BuildContext, E error)?` | Local custom error builder (overrides global). |
| `empty` | `Widget?` | Local custom empty state widget (overrides global). |
| `onRetry` | `VoidCallback?` | Callback triggered for retry actions. |
| `useSkeleton` | `bool` | High-fidelity shimmer vs standard loader. |
| `initialData` | `T?` | Mock data used to shape the skeleton. |
| `useSliver` | `bool` | Set to `true` if used inside a `CustomScrollView`. |
| `sliverAdapter` | `Widget Function(Widget child)?` | custom sliver wrapper (default: `SliverToBoxAdapter`). |

### 1. Basic Usage
```dart
ResourceBuilder<User, Failure>(
  resource: userResource,
  builder: (context, user) => ProfileHeader(user),
)
```

### 2. Skeleton Loading
```dart
ResourceBuilder<User, Failure>(
  resource: userResource,
  useSkeleton: true,
  initialData: User.mock(),
  builder: (context, user) => ProfileHeader(user),
)
```

---

## 📜 PaginatedResourceBuilder (Collections)

The specialized component for building paginated feeds with zero boilerplate.

### Generics
| Type | Description |
| :--- | :--- |
| `T` | The type of individual items in the collection. |
| `P` | The paginated response type (must implement `PaginatedData<T>`). |
| `E` | The type of the error object. |

### Properties
| Property | Type | Description |
| :--- | :--- | :--- |
| `resource` | `Resource<P, E>` | The paginated collection model. |
| `itemBuilder` | `Widget Function(BuildContext, int, T)` | Builds individual list items. |
| `customBuilder` | `Widget Function(BuildContext, List<T>)` | Builds a custom container (e.g., Grid) for items. |
| `loading` | `Widget?` | Local custom loading widget (overrides global). |
| `paginationLoading`| `Widget?` | Local custom pagination loading indicator (overrides global). |
| `error` | `Widget Function(BuildContext, E error)?` | Local custom error builder (overrides global). |
| `empty` | `Widget?` | Local custom empty state widget (overrides global). |
| `onRetry` | `VoidCallback?` | Callback for retry actions. |
| `onLoadMore` | `VoidCallback?` | Triggered when reaching bottom threshold. |
| `onRefresh` | `Future<void> Function()?` | Callback for pull-to-refresh. |
| `refreshBuilder`| `Widget Function(BuildContext, Future<void> Function() onRefresh, Widget child)` | Custom builder for the refresh indicator. |
| `spacing` | `double` | Gap between list items (default: 10). |
| `useSkeleton` | `bool` | Enables shimmer loading via Skeletonizer. |
| `initialData` | `List<T>?` | Skeleton items for shaping current layout. |
| `skeletonBuilder`| `P Function(List<T>)` | Wraps skeleton data in a paginated object. |
| `hasInternalScroll`| `bool` | `true` (default) for standalone; `false` for sliver mode. |
| `paginationThreshold`| `double` | Distance from bottom to trigger more data. |
| `controller` | `ScrollController?` | External scroll controller (if standalone). |
| `physics` | `ScrollPhysics?` | Custom scroll physics for the internal scroll view. |
| `reverse` | `bool` | Whether the scroll view is reversed. |
| `shrinkWrap` | `bool` | Whether the internal scroll view should shrink wrap. |
| `hasInternalScroll`| `bool` | `true` (default) for standalone; `false` for sliver mode. |

> [!TIP]
> **Automatic Refresh Sync**: If `resource.data` is null, native pull-to-refresh (`onRefresh`) is automatically disabled to prevent UI glitches. In these scenarios (like initial errors), use the `onRetry` callback and update your state using `toLoading(redirect: true)`.

### 1. Standalone List (Default)
```dart
PaginatedResourceBuilder<Item, ProductPage, Failure>(
  resource: state.products,
  onRefresh: () => cubit.refresh(),
  onLoadMore: () => cubit.loadMore(),
  itemBuilder: (context, index, item) => ItemCard(item: item),
)
```

### 2. Skeleton Loading
```dart
PaginatedResourceBuilder<Item, ProductPage, Failure>(
  resource: state.products,
  useSkeleton: true,
  initialData: List.generate(5, (index) => Item.mock()),
  skeletonBuilder: (items) => ProductPage(products: items, hasMoreData: false),
  itemBuilder: (context, index, item) => ItemCard(item: item),
)
```

### 3. Custom Layout (e.g., Grid)
Use `customBuilder` when you need something other than a standard list.
```dart
PaginatedResourceBuilder<Item, ProductPage, Failure>(
  resource: state.products,
  customBuilder: (context, items) => SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    delegate: SliverChildBuilderDelegate(
      (context, index) => ItemCard(item: items[index]),
      childCount: items.length,
    ),
  ),
)
```

### 4. Nested in CustomScrollView (Sliver Mode)
Set `hasInternalScroll: false` to use it as a component within a larger scrollable page.
```dart
CustomScrollView(
  slivers: [
    const SliverToBoxAdapter(child: HeaderWidget()),
    PaginatedResourceBuilder<Item, ProductPage, Failure>(
      resource: state.products,
      hasInternalScroll: false, // Essential for sliver mode
      itemBuilder: (context, index, item) => ItemTile(item: item),
    ),
  ],
)
```

---

## 📖 Example

For a complete implementation demonstrating the MVVM pattern, Cubit integration, and premium UI states, see the [example](example) directory.

The example project includes:
- **API Integration**: Real-world data fetching workflows.
- **Global States**: Centralized configuration for loading, error, and empty views.
- **Advanced Lists**: Paginated feeds with infinite scroll and pull-to-refresh.
- **Skeleton UI**: High-fidelity shimmer effects for every state.

---

## 📄 License
This project is licensed under the MIT License.
