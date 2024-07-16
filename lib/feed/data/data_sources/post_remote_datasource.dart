import '../../../core/network/remote/http_helper.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getPosts() async {
    final response = await HttpHelper.getData('ozcan/posts.php');
    if (response != null && response['data'] != null) {
      List postList = response['data'];
      return postList.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
