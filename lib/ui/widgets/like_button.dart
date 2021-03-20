import 'package:flutter/material.dart';

import '../../core/view_models/likebutton_model.dart';
import '../views/base_view.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  const LikeButton({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
      builder: (context, model, child) => Row(
        children: [
          Text('Likes ${model.postLikes(postId)}'),
          SizedBox(width: 10),
          MaterialButton(
            color: Colors.white,
            onPressed: () => model.increaseLikes(postId),
            child: Icon(Icons.thumb_up),
          ),
        ],
      ),
    );
  }
}
