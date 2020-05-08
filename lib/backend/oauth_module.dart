import 'package:flutter/cupertino.dart';

import 'Oauth/user.dart';
import 'Oauth/validators.dart';

enum OAuthType { Login, Register }

class OAuth extends ChangeNotifier with Validator {
  User user = User();
  OAuthType oauthType = OAuthType.Login;
  String get email => user.username;
  Function(String) get setEmail => (value) => user.username = value;
  String get password => user.password;
  Function(String) get setPassword => (value) => user.password = value;

  changeOAuth() {
    if (oauthType == OAuthType.Login) {
      oauthType = OAuthType.Register;
    } else {
      oauthType = OAuthType.Login;
    }
    notifyListeners();
  }

  String changeHeader() {
    String header;
    if (oauthType == OAuthType.Login) {
      header = 'Login';
    } else {
      header = 'Register';
    }
    return header;
  }

  register() {
    bool ret = false;
    if (oauthType == OAuthType.Login) {
      login();
    } else if (oauthType == OAuthType.Register) {
      signUp(user);
    }
    return ret;
  }
}
