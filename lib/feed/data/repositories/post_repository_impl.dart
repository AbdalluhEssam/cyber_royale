import 'package:cyber_royale/feed/data/models/post_model.dart';

import '../../domain/repositories/post_repository.dart';
import '../data_sources/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostModel>> getPosts() async {
    return await remoteDataSource.getPosts();
  }
}
