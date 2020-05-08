import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/login.dart';
import 'backend/oauth_module.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OAuth(),
      child: MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
