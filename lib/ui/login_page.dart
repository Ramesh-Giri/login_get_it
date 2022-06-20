import 'package:flutter/material.dart';
import 'package:flutter_authentication/services/auth_service.dart';
import 'package:flutter_authentication/ui/sign_up.dart';
import 'package:flutter_authentication/utils/validator.dart';

import '../locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Text('Hello', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),),
              const Text('Sign In From Here'),

              const SizedBox(height:32.0),

              TextFormField(
                decoration:const InputDecoration(hintText: 'Email'),
                validator: (email) => Validator().emailValidator(email) ,
                onSaved: (email) => this.email = email!,
              ),

              const SizedBox(height:16.0),

              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                validator: (password) => Validator().passwordValidator(password) ,
                onSaved: (password) => this.password = password!,

              ),

              const SizedBox(height:16.0),

              FractionallySizedBox(
                widthFactor: 0.4,
                child: ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();

                    locator.get<IAuthService>().handleSignInWithEmail(email, password);
                  }
                }, child:const  Text(
                    'Login In'
                )),
              ),
              const SizedBox(height:16.0),

              FractionallySizedBox(
                widthFactor: 0.6,
                child: ElevatedButton(onPressed: ()=> locator.get<IAuthService>().signInWithGoogle(), child:const  Text(
                  'Google Sign In'
                )),
              ),

              const SizedBox(height:16.0),
              const Text('OR', textAlign: TextAlign.center,),

              const SizedBox(height:16.0),

              FractionallySizedBox(
                widthFactor: 0.4,
                child: InkWell(onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())), child:const  Text(
                    'Create new account'
                )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
