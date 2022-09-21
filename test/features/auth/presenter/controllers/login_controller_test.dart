import 'package:flutter_arch/features/auth/data/models/user_model.dart';
import 'package:flutter_arch/features/auth/presenter/controllers/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginController extends Mock implements LoginController {}

void main() {
  late LoginController loginController;

  setUp(() {
    loginController = MockLoginController();
  });

  test('Should login', () async {
    when(
      () => loginController.doLogin(
        email: 'email',
        password: 'password',
      ),
    ).thenAnswer(
      (_) async => tUser,
    );

    var result = await loginController.doLogin(
      email: 'email',
      password: 'password',
    );

    expect(result, tUser);

    verify(
      () => loginController.doLogin(
        email: 'email',
        password: 'password',
      ),
    ).called(1);

    verifyNoMoreInteractions(loginController);
  });
}

var tUser = UserModel(
  bornDate: DateTime.now(),
  email: 'soufeliposales@gmail.com',
  name: 'felipecastrosales',
  pictureUrl: 'https://github.com/felipecastrosales.png',
);
