import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/auth_service.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Sign Up'),
      centerTitle: true,),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              controller: _emailController,
            ),

            const SizedBox(height:16.0),


            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: _passwordController,
            ),

            const SizedBox(height:16.0),
            FractionallySizedBox(
              widthFactor: 0.4,
              child: ElevatedButton(onPressed: () async{
                var user = await locator.get<IAuthService>().handleSignUpWithEmail(_emailController.text.trim(), _passwordController.text.trim());

                if(user != null) {
                  Navigator.pop(context);
                }

              }, child:const  Text(
                  'Sign Up'
              )),
            ),
          ],
        ),
      ),
    );
  }
}
