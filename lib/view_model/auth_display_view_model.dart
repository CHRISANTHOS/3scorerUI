import 'package:flutter/material.dart';
import 'package:scorer_uchenna/view_model/auth_view_model.dart';
import 'package:scorer_uchenna/services/web_services.dart';
import 'package:scorer_uchenna/model/auth_model.dart';

class AuthDisplayViewModel extends ChangeNotifier {
  AuthViewModel? authViewModel;
  AuthViewModel? detailsViewModel;

  bool loggedIn = false;

  Future<void> signUp(
      {required String firstname,
        required String lastname,
        required String email,
        required String username,
        required password,
        required String repeatPassword}) async {
    AuthModel details = await WebServices().signUp(
        username: username,
        firstname: firstname,
        lastname: lastname,
        email: email,
        password: password,
        repeatPassword: repeatPassword);
    authViewModel = AuthViewModel(auth: details);
    notifyListeners();
    loggedIn = true;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required password,
    String? username,
  }) async {
    AuthModel details = await WebServices()
        .login(username: username ?? '', password: password, email: email, );
    authViewModel = AuthViewModel(auth: details);
    notifyListeners();
    loggedIn = true;
  }

  Future<void> getDetails({required String token})async{
    AuthModel details = await WebServices().getUserDetails(token: token);
    detailsViewModel = AuthViewModel(auth: details);
    notifyListeners();
  }

  Future<void> updateDetails(
      {required String token,
        required String firstname,
        required String lastname,
        required String email,
        required String username}) async {
    AuthModel details = await WebServices().updateDetails(
        token: token,
        username: username,
        firstname: firstname,
        lastname: lastname,
        email: email);
    detailsViewModel = AuthViewModel(auth: details);
    notifyListeners();
  }
}