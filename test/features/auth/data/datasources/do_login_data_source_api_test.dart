import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_arch/core/error/failure.dart';
import 'package:flutter_arch/features/auth/data/datasources/do_login_data_source_api.dart';
import 'package:flutter_arch/features/auth/data/models/user_model.dart';

class DioMock extends Mock implements Dio {}

void main() {
  var dio = DioMock();
  var dataSource = DoLoginDataSourceApi(dio);

  test('Should do login on API', () async {
    when(
      () => dio.post(
        any(),
        data: {
          'email': 'soufeliposales@gmail.com',
          'password': '1234567',
        },
      ),
    ).thenAnswer(
      (invocation) => Future.value(
        Response(
          requestOptions: RequestOptions(path: ''),
          data: tkUserApi,
        ),
      ),
    );

    UserModel user = await dataSource.doLogin(
      email: 'soufeliposales@gmail.com',
      password: '1234567',
    );

    expect(user.toMap(), tkUserApi);

    verify(
      () => dio.post(
        any(),
        data: {
          'email': 'soufeliposales@gmail.com',
          'password': '1234567',
        },
      ),
    ).called(1);
    verifyNoMoreInteractions(dio);
  });

  test('Should get error when try do login with api', () async {
    when(
      () => dio.post(
        any(),
        data: {
          'email': 'soufeliposales@gmail.com',
          'password': '1234567',
        },
      ),
    ).thenThrow(
      ServerFailure().props,
    );

    expect(
      () async => await dataSource.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
      throwsA(isA<ServerFailure>()),
    );

    verify(
      () => dio.post(
        any(),
        data: {
          'email': 'soufeliposales@gmail.com',
          'password': '1234567',
        },
      ),
    ).called(1);
    verifyNoMoreInteractions(dio);
  });
}

var tkUserApi = {
  'name': 'felipecastrosales',
  'bornDate': DateTime(2003, 12, 26).toIso8601String(),
  'pictureUrl': 'https://github.com/felipecastrosales.png',
  'email': 'soufeliposales@gmail.com'
};
