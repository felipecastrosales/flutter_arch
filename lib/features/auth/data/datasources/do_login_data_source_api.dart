import 'package:dio/dio.dart';
import 'package:flutter_arch/core/error/failure.dart';
import 'package:flutter_arch/features/auth/data/models/user_model.dart';

import 'do_login_data_source.dart';

class DoLoginDataSourceApi implements DoLoginDataSource {
  final Dio _dio;
  DoLoginDataSourceApi(this._dio);

  @override
  Future<UserModel> doLogin({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _dio.post(
        'http://www.api.com/user',
        data: {
          'email': email,
          'password': password,
        },
      );
      return UserModel.fromMap(response.data);
    } catch (e) {
      throw  ServerFailure();
    }
  }
}
