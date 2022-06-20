import 'package:flutter_authentication/utils/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  //check if the emailValidator returns some error when empty string is passed.
    test('empty email return error string', (){
      var result = Validator().emailValidator('');
      expect(result,'Email can\'t be empty');
    });


    //check if the emailValidator returns no error message as 'email' is passed
    test('non-empty email returns null', (){
      var result = Validator().emailValidator('email');

      expect(result, null);
    });

//check if the passwordValidator returns error message if empty password is passed.
    test('empty password returns error string', (){
      var result = Validator().passwordValidator('');
      expect(result,'Password can\'t be empty');
    });


  //check if the passwordValidator returns error message if length if password is less than 6. Eg: 'pass'
    test('password with less than 6 characters return length related error', (){
      var result = Validator().passwordValidator('pass');
      expect(result,'Password can\'t be less than 6 characters');
    });

  //check if the passwordValidator returns no error message as valid password: 'password' is passed
  test('valid password returns null', (){
      var result = Validator().passwordValidator('password');
      expect(result, null);
    });
}