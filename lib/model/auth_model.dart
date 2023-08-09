class AuthModel {
  String token;
  String userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? repeatPassword;

  AuthModel(
      {required this.token,
        required this.userName,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.repeatPassword});

  factory AuthModel.signUpJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      userName: json['data']['username'],
      firstName: json['data']['firstName'],
      lastName: json['data']['lastName'],
      email: json['data']['email'],
    );
  }

  factory AuthModel.loginJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['accessToken'],
      userName: json['data']['username'],
      firstName: json['data']['firstName'],
      lastName: json['data']['lastName'],
      email: json['data']['email'],
    );
  }
  factory AuthModel.getUserJson(Map<String, dynamic> json) {
    return AuthModel(
      token: '',
      userName: json['data']['username'],
      firstName: json['data']['firstName'] ?? '',
      lastName: json['data']['lastName'] ?? '',
      email: json['data']['email'] ?? '',
    );
  }
  factory AuthModel.updateJson(Map<String, dynamic> json) {
    return AuthModel(
      token: '',
      userName: json['data']['username'],
      firstName: json['data']['firstName'],
      lastName: json['data']['lastName'],
      email: json['data']['email'],
    );
  }

  Map<String, dynamic> signUpToJson() {
    return {
      'firstName': firstName ?? '',
      'lastName': lastName ?? '',
      'email': email,
      'username': userName,
      'password': password,
      'repeat_password': repeatPassword
    };
  }

  Map<String, dynamic> loginToJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  Map<String, String> updateToJson() {
    return {
      'firstName': firstName ?? '',
      'lastName': lastName ?? '',
      'email': email!,
      'username': userName,
    };
  }
}