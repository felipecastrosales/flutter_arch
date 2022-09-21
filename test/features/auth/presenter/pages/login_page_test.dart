import 'package:flutter/material.dart';
import 'package:flutter_arch/features/auth/presenter/controllers/login_controller.dart';
import 'package:flutter_arch/features/auth/presenter/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginController extends Mock implements LoginController {}

void main() {
  testWidgets('Should renders LoginPage', (tester) async {
    await _createWidget(
      tester: tester,
    );

    expect(
      find.byType(LoginPage),
      findsOneWidget,
    );

    expect(
      find.byKey(
        const Key('scaffold_key'),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(
        const Key('center_key'),
      ),
      findsOneWidget,
    );

    expect(
      find.byKey(
        const Key('button_key'),
      ),
      findsOneWidget,
    );

    expect(
      find.text('Logar'),
      findsOneWidget,
    );

    expect(
      find.byKey(
        const Key('button_text_key'),
      ),
      findsOneWidget,
    );
  });
}

Future<void> _createWidget({
  required WidgetTester tester,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: LoginPage(
          controller: MockLoginController(),
        ),
      ),
    ),
  );
}
