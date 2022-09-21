import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_arch/core/error/failure.dart';
import 'package:flutter_arch/features/auth/domain/entities/user.dart';
import 'package:flutter_arch/features/auth/domain/repositories/do_login_repository.dart';
import 'package:flutter_arch/features/auth/domain/usecases/do_login.dart';

class MockDoLoginRepository extends Mock implements DoLoginRepository {}

void main() {
  DoLoginRepository doLoginRepository = MockDoLoginRepository();
  DoLogin doLogin = DoLogin(doLoginRepository);

  test('Should login', () async {
    when(
      () => doLoginRepository.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    ).thenAnswer(
      (_) async => Right(tUser),
    );

    var result = await doLogin(
      DoLoginParams(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    );

    expect(result, isA<Right>());
    expect(result, Right(tUser));

    verify(
      () => doLoginRepository.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    ).called(1);
    verifyNoMoreInteractions(doLoginRepository);
  });

  test('Should get wrong password error when logging in', () async {
    when(
      () => doLoginRepository.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    ).thenAnswer(
      (_) async => Left(
        PasswordWrongFailure(),
      ),
    );

    var result = await doLogin(
      DoLoginParams(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    );

    expect(result, isA<Left>());
    expect(
      result,
      Left(PasswordWrongFailure()),
    );

    verify(
      () => doLoginRepository.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    ).called(1);
    verifyNoMoreInteractions(doLoginRepository);
  });

  test('Should get not found error when logging in', () async {
    when(
      () => doLoginRepository.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    ).thenAnswer(
      (_) async => Left(
        NotFoundFailure(),
      ),
    );

    var result = await doLogin(
      DoLoginParams(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    );

    expect(result, isA<Left>());
    expect(
      result,
      Left(NotFoundFailure()),
    );

    verify(
      () => doLoginRepository.doLogin(
        email: 'soufeliposales@gmail.com',
        password: '1234567',
      ),
    ).called(1);
    verifyNoMoreInteractions(doLoginRepository);
  });
}

var tUser = User(
  bornDate: DateTime.now(),
  email: 'soufeliposales@gmail.com',
  name: 'felipecastrosales',
  pictureUrl: 'https://github.com/felipecastrosales.png',
);
