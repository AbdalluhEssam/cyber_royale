import 'package:get_it/get_it.dart';

import 'feed/data/data_sources/post_remote_datasource.dart';
import 'feed/data/repositories/post_repository_impl.dart';
import 'feed/domain/repositories/post_repository.dart';
import 'feed/domain/use_cases/get_posts.dart';
import 'feed/presentation/manager/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => SocialBloc());

  // Use cases
  sl.registerLazySingleton(() => GetPosts(sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl());
}
