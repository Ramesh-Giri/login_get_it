import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../ui/home_page.dart';
import '../ui/login_page.dart';


abstract class IAuthService{

  Widget handleAuthState();
  Future<UserCredential> signInWithGoogle();
  void handleSignInWithEmail(String email, String password);
  Future<User?> handleSignUpWithEmail(String email, String password);
  void signOut();
}

class AuthService implements IAuthService{

  @override
  Widget handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){

        if(snapshot.hasData){
          //if the user is logged in, take to home page
          return const HomePage();
        }else{

          //if the user is logged in, redirect to the login page
          return const LoginPage();
        }
    });
  }


  @override
  Future<UserCredential> signInWithGoogle() async{
    //start the auth flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
    scopes: <String>['email']).signIn();


    //get detail from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;


    //create new credential

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //return user credential after successful signin
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  @override
  handleSignInWithEmail(String email, String password) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      if (kDebugMode) {
        print('Invalid  ${e.toString()}');

      }
    }

  }

  @override
  Future<User?> handleSignUpWithEmail(String email, String password) async{
    User? user;
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
        var credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        user = credential.user;
    }catch(e){
      if (kDebugMode) {
        print('Invalid  ${e.toString()}');

      }
    }
    return user;
  }

  @override
  void signOut(){
    //signout from firebase auth
    final GoogleSignIn googleSignIn = GoogleSignIn();

    FirebaseAuth.instance.signOut();

    googleSignIn.signOut();

  }

}