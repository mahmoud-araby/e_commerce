import 'dart:convert';

import 'package:Login/backend/Oauth/user.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

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

  Future<Map<String, dynamic>> login(User user) async {
    print('start');
    http.Response response = await http.post(loginLink, body: {
      "identifier": user.username,
      "password": user.password,
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"status": true, "message": "Your Id sucessfully Logged"};
    } else {
      return {
        "status": false,
        "message": data["message"][0]["messages"][0]["message"]
      };
    }
  }

  Future<Map<String, dynamic>> signUp(User user) async {
    print('start');
    http.Response response = await http.post(oAuthLink, body: {
      "username": user.username,
      "password": user.password,
      "email": user.username,
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"status": true, "message": "Your Id sucessfully Added"};
    } else {
      return {
        "status": false,
        "message": data["message"][0]["messages"][0]["message"]
      };
    }
  }
}
