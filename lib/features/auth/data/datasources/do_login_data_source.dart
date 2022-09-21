import 'package:flutter_arch/features/auth/data/models/user_model.dart';

abstract class DoLoginDataSource {
  Future<UserModel> doLogin({
    required String email,
    required String password,
  });
}
