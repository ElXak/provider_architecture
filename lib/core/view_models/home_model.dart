import '../../get_it.dart';
import '../enums/view_state.dart';
import '../models/post.dart';
import '../services/posts_service.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = getIt<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
