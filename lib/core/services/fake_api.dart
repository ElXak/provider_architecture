import 'package:http/http.dart' as http;

import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';
import 'api.dart';

/// The service responsible for networking requests
class FakeApi implements Api {
  static const endpoint = 'jsonplaceholder.typicode.com';

  http.Client client = http.Client();

  Future<User> getUserProfile(int userId) async {
    await Future.delayed(Duration(seconds: 1));

    switch (userId) {
      case 1:
        return User(id: 1, username: 'ebo', name: 'Elmurod');
        break;
      default:
        return null;
    }
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    await Future.delayed(Duration(seconds: 1));

    switch (userId) {
      case 1:
        return List<Post>.generate(10, (index) => Post());
        break;
      default:
        return null;
    }
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    await Future.delayed(Duration(seconds: 1));

    switch (postId) {
      case 1:
        return List<Comment>.generate(10, (index) => Comment());
        break;
      default:
        return null;
    }
  }
}
