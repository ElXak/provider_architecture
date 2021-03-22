import '../../get_it.dart';
import '../models/post.dart';
import 'fake_api.dart';
import 'http_api.dart';

class PostsService {
  var _api = USE_FAKE_IMPLEMENTATION ? getIt<FakeApi>() : getIt<HttpApi>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async =>
      _posts = await _api.getPostsForUser(userId);

  void incrementLikes(int postId) =>
      _posts.firstWhere((post) => post.id == postId).likes++;
}
