import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutridish/main.dart';

void main() {
  testWidgets('Verify that StartPage displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NutridishApp());

    // Verify that StartPage has a Text widget with the text 'NUTRIDISH'.
    expect(find.text('NUTRIDISH'), findsOneWidget);

    // Verify that StartPage has a Text widget with the text 'LOGIN'.
    expect(find.text('LOGIN'), findsOneWidget);

    // Verify that StartPage has a Text widget with the text 'REGISTER'.
    expect(find.text('REGISTER'), findsOneWidget);
  });
}