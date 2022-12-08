

import 'package:crypto/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'main_app.dart';

disable() {}

void main() {
  testWidgets('When button click THEN return values',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: TestAppWidget(
              body: TestButton(
                label: "Ativado",
                cor: Colors.pink,
                disableCor: Color.fromARGB(255, 85, 16, 39),
                isActive: true,
                onClick: disable,
              ),
            ),
          ),
        );

        expect(find.byType(TestButton), findsOneWidget);
        await tester.tap(find.text("Ativado"));
        expect(find.text("Ativado"), findsOneWidget);
      });
}
