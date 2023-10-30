import 'package:as_film_mini_project/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  // testWidgets('Judul harus Contacts', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MaterialApp(
  //     home: ContactPage(),
  //   ));

  //   expect(find.text('Contacts'), findsOneWidget);
  // });

  testWidgets(
      'Body Harus memiliki Field Userame, Password dan Button Submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    expect(find.widgetWithText(TextField, 'Username'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}