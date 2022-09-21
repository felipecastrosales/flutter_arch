import 'package:flutter/material.dart';

import 'package:flutter_arch/features/auth/presenter/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold_key'),
      body: Center(
        key: const Key('center_key'),
        child: ElevatedButton(
          key: const Key('button_key'),
          onPressed: () async {
            await controller
                .doLogin(email: 'soufeliposales@gmail.com', password: '1234567')
                .catchError((e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.message),
                ),
              );
            }).then(
              (value) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Logado com sucesso!',
                    key: Key('snackbar_key'),
                  ),
                ),
              ),
            );
          },
          child: const Text(
            'Logar',
            key: Key('button_text_key'),
          ),
        ),
      ),
    );
  }
}
