import 'package:flutter_arch/features/auth/domain/entities/user.dart';
import 'package:flutter_arch/features/auth/domain/usecases/do_login.dart';

class LoginController {
  final DoLogin _doLogin;
  LoginController({
    required DoLogin doLogin,
  }) : _doLogin = doLogin;

  Future<User> doLogin({
    required String email,
    required String password,
  }) async {
    var response = await _doLogin(
      DoLoginParams(
        email: email,
        password: password,
      ),
    );

    var result = response.fold((l) => l, (r) => r);

    if (result is User) {
      return result;
    } else {
      throw result;
    }
  }
}
