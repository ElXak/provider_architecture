import '../../get_it.dart';
import '../enums/view_state.dart';
import '../models/post.dart';
import '../services/api.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = getIt<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
