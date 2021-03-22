import '../../get_it.dart';
import '../enums/view_state.dart';
import '../models/comment.dart';
import '../services/fake_api.dart';
import '../services/http_api.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  var _api = USE_FAKE_IMPLEMENTATION ? getIt<FakeApi>() : getIt<HttpApi>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
