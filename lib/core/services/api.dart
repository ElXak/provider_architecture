import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/comment.dart';
import '../models/post.dart';
import '../models/user.dart';

/// The service responsible for networking requests
class Api {
  static const endpoint = 'jsonplaceholder.typicode.com';

  http.Client client = http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    Uri url = Uri.https(endpoint, '/users/$userId');
    http.Response response = await client.get(url);

    // if data is ok convert and return
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      // print('http.response => $data');
      return User.fromJson(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }

    // return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = [];

    // Get user posts for id
    Uri url = Uri.https(endpoint, '/posts', {'userId': '$userId'});
    http.Response response = await client.get(url);

    // if data is ok convert and return
    if (response.statusCode == 200) {
      // print('http.response => ${response.body}');
      // parse into List
      List<dynamic> parsed = json.decode(response.body) as List<dynamic>;

      // loop and convert each item to Post
      for (var post in parsed) {
        posts.add(Post.fromJson(post));
      }

      return posts;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];

    // Get comments for post
    Uri url = Uri.https(endpoint, '/comments', {'postId': '$postId'});
    http.Response response = await client.get(url);

    // if data is ok convert and return
    if (response.statusCode == 200) {
      // Parse into List
      List<dynamic> parsed = json.decode(response.body) as List<dynamic>;

      // Loop and convert each item to a Comment
      for (var comment in parsed) {
        comments.add(Comment.fromJson(comment));
      }

      return comments;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
