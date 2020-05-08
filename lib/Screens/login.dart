import 'package:Login/backend/oauth_module.dart';
import 'package:Login/component/password.dart';
import 'package:Login/component/username.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _loginKey,
          child: Column(
            children: <Widget>[
              heading(context),
              UserName(),
              PassWord(),
              acceptField(context),
              switchOAth(context),
            ],
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
    return FlatButton(
      onPressed: () {
        bool ret;
        if (_loginKey.currentState.validate()) {
          _loginKey.currentState.save();
          ret = Provider.of<OAuth>(context, listen: false).register();
          if (ret) {}
        }
      },
      child: Text(
        'Login',
      ),
    );
  }

  Widget switchOAth(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'New User ?',
          ),
          WidgetSpan(
            baseline: TextBaseline.ideographic,
            child: GestureDetector(
              child: Text(
                '${Provider.of<OAuth>(context).changeHeader()}',
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
