import 'package:Login/backend/oauth_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: Provider.of<OAuth>(context, listen: false).setEmail,
      validator: Provider.of<OAuth>(context).validateEmail,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'example@you.com',
      ),
    );
  }
}
