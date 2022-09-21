import 'package:dartz/dartz.dart';
import 'package:flutter_arch/features/auth/data/datasources/do_login_data_source_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_arch/core/error/failure.dart';
import 'package:flutter_arch/features/auth/data/datasources/do_login_data_source.dart';
import 'package:flutter_arch/features/auth/data/models/user_model.dart';
import 'package:flutter_arch/features/auth/data/repositories/do_login_repository_impl.dart';
import 'package:flutter_arch/features/auth/domain/repositories/do_login_repository.dart';

class MockDoLoginDataSource extends Mock implements DoLoginDataSource {}

class MockDoLoginDataSourceApi extends Mock implements DoLoginDataSourceApi {}

void main() {
  DoLoginDataSource dataSource = MockDoLoginDataSource();
  DoLoginRepository repository = DoLoginRepositoryImpl(dataSource);

  test('Should login', () async {
    when(
      () => dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer(
      (invocation) async => tUser,
    );

    var result = await repository.doLogin(
      email: 'soufeliposales@gmail.com',
      password: '1234567',
    );

    expect(result, isA<Right>());
    expect(result, Right(tUser));

    verify(
      () => dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).called(1);

    verifyNoMoreInteractions(dataSource);
  });

  test('Should error when do login', () async {
    when(
      () => dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenThrow(PasswordWrongFailure());

    var result = await repository.doLogin(
      email: 'soufeliposales@gmail.com',
      password: '1234567',
    );

    expect(result, isA<Left>());
    expect(
      result,
      Left(PasswordWrongFailure()),
    );

    verify(
      () => dataSource.doLogin(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).called(1);

    verifyNoMoreInteractions(dataSource);
  });
}

var tUser = UserModel(
  bornDate: DateTime.now(),
  email: 'soufeliposales@gmail.com',
  name: 'felipecastrosales',
  pictureUrl: 'https://github.com/felipecastrosales.png',
);
