import 'dart:async';

import '../../get_it.dart';
import '../models/user.dart';
import 'fake_api.dart';
import 'http_api.dart';

class AuthenticationService {
  var _api = USE_FAKE_IMPLEMENTATION ? getIt<FakeApi>() : getIt<HttpApi>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    User fetchedUser = await _api.getUserProfile(userId);

    bool hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
