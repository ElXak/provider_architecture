import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/ui/widgets/comments.dart';

import '../../core/models/post.dart';
import '../../core/models/user.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
