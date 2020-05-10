import 'package:Login/Screens/products.dart';
import 'package:Login/backend/oauth_module.dart';
import 'package:Login/component/password.dart';
import 'package:Login/component/username.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _loginKey,
            child: Column(
              children: <Widget>[
                heading(context),
                UserName(),
                PassWord(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: acceptField(context),
                ),
                switchOAth(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget heading(BuildContext context) {
    return Text(
      '${Provider.of<OAuth>(context).changeHeader()}',
      style: TextStyle(
        fontSize: 40,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget acceptField(BuildContext context) {
    if (Provider.of<OAuth>(context, listen: true).isBusy()) {
      return CircularProgressIndicator();
    } else {
      return RaisedButton(
          color: Colors.blue,
          onPressed: () async {
            bool ret;
            if (_loginKey.currentState.validate()) {
              _loginKey.currentState.save();
              bool key = await oauthEmail(context);
              print(key);
              if (key == true) {
                Navigator.pushReplacementNamed(context, Products.id);
              }
            }
          },
          child: Text(
            '${Provider.of<OAuth>(context).changeHeader()}',
          ));
    }
  }

  Future<bool> oauthEmail(BuildContext context) async {
    Map<String, dynamic> response =
        await Provider.of<OAuth>(context, listen: false).register();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        content: Text(
          response["message"],
        ),
      ),
    );
    return response["status"];
  }

  Widget switchOAth(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: Provider.of<OAuth>(context).changeHeader() == "Login"
                ? 'New User? '
                : 'Existing User? ',
          ),
          WidgetSpan(
            baseline: TextBaseline.ideographic,
            child: GestureDetector(
              child: Text(
                Provider.of<OAuth>(context).changeHeader() == "Login"
                    ? 'Register'
                    : 'Login',
                style: user.copyWith(
                  color: Colors.blue,
                ),
              ),
              onTap: Provider.of<OAuth>(context).changeOAuth,
            ),
          ),
        ],
      ),
      style: user,
    );
  }
}
