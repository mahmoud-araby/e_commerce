import 'dart:convert';

import 'package:Login/backend/Oauth/user.dart';
import 'package:http/http.dart' as http;

String oAuthLink = 'http://127.0.0.1:1337/auth/local/register';

mixin Validator {
  String validateEmail(String email) {
    if (email.contains('@')) {
      return null;
    }
    return 'Enter Valid Email';
  }

  String validatePassword(String password) {
    if (password.length >= 6) {
      return null;
    }
    return 'Password must be 6 char length';
  }

  login() {}

  signUp(User user) async {
    print('start');
    http.Response response = await http.post(oAuthLink, body: {
      "username": user.username,
      "password": user.password,
      "email": user.username,
    });
    print(response.statusCode);
    var data = jsonDecode(response.body);
    print(data);
    print('done');
  }
}
