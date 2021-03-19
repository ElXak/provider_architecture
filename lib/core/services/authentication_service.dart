import 'dart:async';

import '../../get_it.dart';
import '../models/user.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = getIt<Api>();

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
