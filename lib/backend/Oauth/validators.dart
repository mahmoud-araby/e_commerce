import 'dart:convert';

import 'package:Login/backend/Oauth/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../config.dart';
import 'authed_user.dart';

mixin Validator {
  AuthedUser registeredUser = AuthedUser();

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
      print(data);
      await updateRegistered(data, data["cart"]);
      return {"status": true, "message": "Your Id successfully Logged"};
    } else {
      return {
        "status": false,
        "message": data["message"][0]["messages"][0]["message"]
      };
    }
  }

  Future<Map<String, dynamic>> signUp(User user) async {
    print('start');
    http.Response cartResponse = await http.post(CartLink);
    Map cartData = jsonDecode(cartResponse.body);
    print(cartData['id']);
    http.Response response = await http.post(oAuthLink, body: {
      "username": user.username,
      "password": user.password,
      "email": user.username,
      "cart": cartData['id'],
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(data);
      await updateRegistered(data, cartData['id']);
      return {"status": true, "message": "Your Id successfully Added"};
    } else {
      return {
        "status": false,
        "message": data["message"][0]["messages"][0]["message"]
      };
    }
  }

  Future<void> updateRegistered(
      Map<String, dynamic> response, String card_id) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    registeredUser.jwt = response['jwt'];
    registeredUser.username = response['user']['username'];
    registeredUser.cart_id = card_id;
    _pref.setString('user', jsonEncode(registeredUser.toMap));
    print(response['username']);
  }

  Future<void> getRegistered() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var data = _pref.getString('user');
    if (data != null) {
      Map response = jsonDecode(data);
      print(response);
      registeredUser.formMap(response);
    }
  }

  Future<void> deleteRegistered() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove('user');
    registeredUser.empty();
  }
}
