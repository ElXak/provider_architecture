import 'package:flutter/material.dart';

import 'home_view.dart';
import 'login_view.dart';

class TabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs Demo'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginView(),
            HomeView(),
          ],
        ),
      ),
    );
  }
}
