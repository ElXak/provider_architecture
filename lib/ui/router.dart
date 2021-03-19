import 'package:flutter/material.dart';

import '../core/models/post.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/post_view.dart';

class Router {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
        break;
      case '/post':
        Post post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route is defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
