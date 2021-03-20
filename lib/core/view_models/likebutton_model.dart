import '../../get_it.dart';
import '../services/posts_service.dart';
import 'base_model.dart';

class LikeButtonModel extends BaseModel {
  PostsService _postsService = getIt<PostsService>();

  int postLikes(int postId) =>
      _postsService.posts.firstWhere((post) => post.id == postId).likes;

  void increaseLikes(int postId) {
    _postsService.incrementLikes(postId);
    notifyListeners();
  }

/*
  @override
  void dispose() {
    print('LikeButtonModel disposing...');
    super.dispose();
  }
*/
}
