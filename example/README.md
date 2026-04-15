# 🚀 Resource State Builder Example

A professional-grade example demonstrating how to implement a data-driven UI using the `resource_state_builder` package. This project follows the **MVVM (Model-View-ViewModel)** architectural pattern and uses **Cubit** for state management.

## ✨ Key Features Demonstrated

- **Type-Safe State Management**: Using `Resource<T, E>` to handle loading, success, and error states without boilerplate.
- **Global UI Configuration**: Leveraging `ResourceConfig` in `main.dart` to define app-wide loading and error builders.
- **Infinite Scrolling**: Using `PaginatedResourceBuilder` to handle list pagination, pull-to-refresh, and empty states.
- **High-Fidelity Skeletons**: Implementing `useSkeleton: true` to provide a premium shimmer effect during data fetching.

## 🏗 Architecture

The app is structured into clearly defined layers:

- **`models/`**: Data structures, including the `PaginatedData` implementation for the API response.
- **`repositories/`**: Handles network requests using `Dio`.
- **`cubits/`**: Manages the screen state using `Resource` containers.
- **`views/`**: Renders the UI using `ResourceBuilder` and `PaginatedResourceBuilder`.
- **`service_locator.dart`**: Dependency injection using `GetIt`.

## 🚀 Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Moo-Meshrif/resource_State_builder.git
   cd resource_State_builder/example
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## 📖 Important Snippets

### Global Configuration (`main.dart`)
Define your app's default loading and error states once at the root:
```dart
ResourceConfig<String>(
  loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
  errorBuilder: (context, error, onRetry) => ErrorView(message: error, onRetry: onRetry),
  child: MaterialApp(...),
)
```

### Paginated List (`post_page.dart`)
Render complex lists with minimal code:
```dart
PaginatedResourceBuilder<Post, PostsResponse, String>(
  resource: state.posts,
  useSkeleton: true,
  initialData: Post.mock,
  skeletonBuilder: (items) => PostsResponse(posts: items),
  onRefresh: cubit.refresh,
  onLoadMore: cubit.loadMore,
  itemBuilder: (context, index, post) => PostTile(post),
)
```

---

*This example project uses [JSONPlaceholder](https://dummyjson.com/) for mock API data.*
