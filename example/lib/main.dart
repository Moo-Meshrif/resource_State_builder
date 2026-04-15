import 'package:flutter/material.dart';
import 'package:resource_state_builder/resource_state_builder.dart';
import 'service_locator.dart';
import 'views/post_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const PostApp());
}

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) => ResourceConfig<String>(
        loadingBuilder: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        emptyBuilder: (context, onRetry) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const Text(
                'No data found.',
                style: TextStyle(fontSize: 18),
              ),
              if (onRetry != null)
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Retry'),
                ),
            ],
          ),
        ),
        errorBuilder: (context, error, onRetry) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              Text(
                'Oops! Something went wrong: $error',
                textAlign: TextAlign.center,
              ),
              if (onRetry != null)
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Retry'),
                ),
            ],
          ),
        ),
        child: MaterialApp(
          title: 'Resource State Builder Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const PostPage(),
        ),
      );
}
