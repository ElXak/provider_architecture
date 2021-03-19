import '../../get_it.dart';
import '../enums/view_state.dart';
import '../models/comment.dart';
import '../services/api.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api = getIt<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
