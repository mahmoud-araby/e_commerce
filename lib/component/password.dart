import 'package:Login/backend/oauth_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassWord extends StatefulWidget {
  @override
  _PassWordState createState() => _PassWordState();
}

class _PassWordState extends State<PassWord> {
  bool isShown = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) {
        Provider.of<OAuth>(context, listen: false).user.password = value;
      },
      validator: Provider.of<OAuth>(context).validatePassword,
      obscureText: isShown,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '******',
        suffixIcon: IconButton(
          icon: Icon(isShown ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              if (isShown) {
                isShown = false;
              } else {
                isShown = true;
              }
              print(isShown);
            });
          },
        ),
      ),
    );
  }
}
