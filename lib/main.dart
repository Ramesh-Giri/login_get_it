import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/services/auth_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'locator.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //initialize firebase
  await Firebase.initializeApp();

  setLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Authentication',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //get the page from the auth service
      home: locator.get<IAuthService>().handleAuthState(),
    );
  }
}

