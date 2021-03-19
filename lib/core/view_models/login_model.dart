import '../../get_it.dart';
import '../enums/view_state.dart';
import '../services/authentication_service.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      getIt<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    int userId = int.tryParse(userIdText);

    // Not a number
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    bool success = await _authenticationService.login(userId);

    // Handle additional error here. Put above login.

    setState(ViewState.Idle);
    return success;
  }
}
