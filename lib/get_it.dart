import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/services/posts_service.dart';
import 'core/view_models/comments_model.dart';
import 'core/view_models/home_model.dart';
import 'core/view_models/likebutton_model.dart';
import 'core/view_models/login_model.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => Api());
  getIt.registerLazySingleton(() => AuthenticationService());
  getIt.registerLazySingleton(() => PostsService());

  getIt.registerLazySingleton(() => LoginModel());
  getIt.registerFactory(() => HomeModel());
  getIt.registerFactory(() => CommentsModel());
  getIt.registerFactory(() => LikeButtonModel());
}
