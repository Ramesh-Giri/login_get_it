import 'package:flutter/material.dart';
import 'package:flutter_authentication/ui/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){


//wrapping widget with MaterialAPp so that Me diaQuery item can be found while testing individual page
  Widget makeTestableWidget (Widget child){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async{

      LoginPage loginPage = const LoginPage();
      await tester.pumpWidget(makeTestableWidget(loginPage));

  });

}