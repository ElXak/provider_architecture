import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

abstract class Api {
  Future<User> getUserProfile(int userId);

  Future<List<Post>> getPostsForUser(int userId);

  Future<List<Comment>> getCommentsForPost(int postId);
}
