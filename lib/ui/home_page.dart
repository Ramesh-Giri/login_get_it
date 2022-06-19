import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
            locator.get<IAuthService>().signOut();
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to Home Screen ${FirebaseAuth.instance.currentUser!.email}'
        ),
      ),
    );
  }
}
