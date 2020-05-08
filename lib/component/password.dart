import 'package:Login/backend/oauth_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) {
        Provider.of<OAuth>(context, listen: false).user.password = value;
      },
      validator: Provider.of<OAuth>(context).validatePassword,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '******',
      ),
    );
  }
}
