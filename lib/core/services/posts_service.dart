import '../../get_it.dart';
import '../models/post.dart';
import 'api.dart';

class PostsService {
  Api _api = getIt<Api>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async =>
      _posts = await _api.getPostsForUser(userId);

  void incrementLikes(int postId) =>
      _posts.firstWhere((post) => post.id == postId).likes++;
}
