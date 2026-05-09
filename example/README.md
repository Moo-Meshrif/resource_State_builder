# 🚀 Resource State Builder Example

A professional-grade example demonstrating how to implement a complex, data-driven UI using the `resource_state_builder` package. This project follows the **MVVM (Model-View-ViewModel)** architectural pattern and uses **Cubit** for state management.

## ✨ Key Features Demonstrated

- **Type-Safe State Management**: Using `Resource<T, E>` to handle loading, success, and error states without boilerplate.
- **Composite Screens**: Using `MultiResourceBuilder` to elegantly handle pages with multiple independent API calls (e.g., Profile + Posts Feed).
- **Global UI Configuration**: Leveraging `ResourceConfig` in `main.dart` to define app-wide loading, error, and empty states.
- **Infinite Scrolling**: Using `PaginatedResourceDef` within the multi-builder to handle list pagination, pull-to-refresh, and empty states.
- **High-Fidelity Skeletons**: Leveraging the `useSkeleton` flag to provide a premium shimmer effect during initial data fetching, rather than blocking the UI with full-page loaders.

## 🏗 Architecture

The app is structured into clearly defined layers:

- **`models/`**: Data structures (e.g., `User`, `Post`), including the `PaginatedData` implementation for the API response.
- **`repositories/`**: Handles network requests using `Dio` (simulated in this example).
- **`cubits/`**: Manages the screen state using `Resource` containers.
- **`views/`**: Renders the UI using `MultiResourceBuilder`.
- **`widgets/`**: Reusable components like the custom `StatusBanner`.
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
  defaultGlobalError: 'Unable to load content at the moment.',
  loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
  errorBuilder: (context, error, onRetry) => ErrorView(message: error, onRetry: onRetry),
  child: MaterialApp(...),
)
```

### Composite Pages (`multi_resource_page.dart`)
Render complex screens with multiple data sources seamlessly:
```dart
MultiResourceBuilder<String>(
  globalError: 'Failed to load page content',
  onRefresh: () => cubit.refreshAll(),
  standards: [
    ResourceDef<User, String>(
      resource: state.userResource,
      initialData: User.mock,
      builder: (context, user) => _ProfileHeader(user: user),
    ),
  ],
  paginated: PaginatedResourceDef<Post, PostsResponse, String>(
    resource: state.postResource,
    initialData: Post.mock,
    onLoadMore: () => cubit.loadMore(),
    itemBuilder: (context, index, post) => PostWidget(post: post),
    skeletonBuilder: (items) => PostsResponse(posts: items),
  ),
)
```

---

*This example project uses simulated API data to demonstrate the library's capabilities.*
