import 'dart:io';
import 'package:scorer_uchenna/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WebServices {
  final signUpURL = dotenv.env['signUpURL'];
  final loginUrl = dotenv.env['loginUrl'];
  final userDetails = dotenv.env['userDetails'];
  final updateURL = dotenv.env['updateURL'];
  final headers = {'Content-Type': 'application/json'};

  Future<AuthModel> signUp(
      {required String firstname,
        required String lastname,
        required String email,
        required String username,
        required String? password,
        required String? repeatPassword}) async {
    final data = AuthModel(
        token: '',
        userName: username,
        firstName: firstname,
        lastName: lastname,
        email: email,
        password: password,
        repeatPassword: repeatPassword);

    http.Response response = await http.post(Uri.parse(signUpURL!),
        body: jsonEncode(data.signUpToJson()), headers: headers);
    if (response.statusCode == 201) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return AuthModel.signUpJson(json);
    } else {
      throw Exception('Can\'t get data');
    }
  }

  Future<AuthModel> login(
      {required String username,
        required String password,
        required String email}) async {
    final data = AuthModel(
        token: '', userName: username, password: password, email: email);

    http.Response response = await http.post(Uri.parse(loginUrl!),
        body: jsonEncode(data.loginToJson()), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return AuthModel.loginJson(json);
    } else {
      throw Exception('Can\'t get data');
    }
  }

  Future<AuthModel> getUserDetails({required String token}) async {
    http.Response response = await http.get(Uri.parse(userDetails!), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return AuthModel.getUserJson(json);
    } else {
      throw Exception('Can\'t get data');
    }
  }

  Future<AuthModel> updateDetails(
      {required String token,
        required String firstname,
        required String lastname,
        required String email,
        required String username}) async {
    final data = AuthModel(
        token: token,
        userName: username,
        firstName: firstname,
        lastName: lastname,
        email: email);

    http.MultipartRequest request = http.MultipartRequest('PATCH', Uri.parse(updateURL!))
      ..headers.addAll({
        'Authorization': 'Bearer $token'
      })
      ..fields.addAll(data.updateToJson());

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      Map<String, dynamic> json = jsonDecode(respStr);
      return AuthModel.updateJson(json);
    } else {
      throw Exception('Can\'t get data');
    }
  }
}
