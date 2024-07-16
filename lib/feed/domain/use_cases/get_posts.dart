import 'package:cyber_royale/feed/data/models/post_model.dart';

import '../repositories/post_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<PostModel>> call() async {
    return await repository.getPosts();
  }
}
