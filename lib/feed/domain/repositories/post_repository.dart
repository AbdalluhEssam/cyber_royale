
import 'package:cyber_royale/feed/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
