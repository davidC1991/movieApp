// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/helpers/dependency_injection.dart';

import 'package:movie_app/main.dart';
import 'package:movie_app/preferences/auth_preference.dart';

void main() {
 
  
  testWidgets('widget myApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = new AuthPreference();
    await prefs.initPrefs();
    DependencyInjection.initialize();
    final AuthPreference authPreference = AuthPreference();

    await tester.pumpWidget(MyApp());
    if (authPreference.isUserLogged=='pageView'){
       expect(find.text('welcome'), findsOneWidget);
    }else{
       expect(find.text('Home'), findsOneWidget);
    }

  });
}
