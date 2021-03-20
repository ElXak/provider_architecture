import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enums/view_state.dart';
import '../../core/models/post.dart';
import '../../core/models/user.dart';
import '../../core/view_models/home_model.dart';
import '../shared/app_colors.dart';
import '../shared/text_styles.dart';
import '../shared/ui_helpers.dart';
import '../views/base_view.dart';
import '../widgets/postlist_item.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Here are all your posts',
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: getPostsUi(model.posts)),
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () =>
              Navigator.pushNamed(context, '/post', arguments: posts[index])
                  .then(onGoBack),
        ),
      );

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }
}
