import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'repositories/post_repository.dart';
import 'cubits/post_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Networking
  locator.registerLazySingleton<Dio>(() => Dio());

  // Repositories
  locator.registerLazySingleton<PostRepository>(
    () => PostRepository(locator<Dio>()),
  );

  // Cubits (Factories usually, as they have state)
  locator.registerFactory<PostCubit>(
    () => PostCubit(locator<PostRepository>()),
  );
}
