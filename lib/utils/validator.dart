abstract class IValidator{

  //validate the email
  String? emailValidator(String? email);

  //validate the password
  String? passwordValidator(String? password);

}


class Validator implements IValidator{

  @override
  String? emailValidator(email) {
      return email!.isEmpty ? 'Email can\'t be empty': null;
  }

  @override
  String? passwordValidator(password) {

    if (password!.isEmpty ){
      return 'Password can\'t be empty';
    }

    if(password.length < 6){
      return 'Password can\'t be less than 6 characters';
    }
    return null;
  }

}