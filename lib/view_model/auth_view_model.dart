import 'package:scorer_uchenna/model/auth_model.dart';

class AuthViewModel{

  AuthModel auth;

  AuthViewModel({required this.auth});

  String get token{
    return auth.token;
  }

  String get firstname{
    return auth.firstName ?? '';
  }

  String get lastname{
    return auth.lastName ?? '';
  }

  String get username{
    return auth.userName;
  }

  String get email{
    return auth.email ?? '';
  }



}