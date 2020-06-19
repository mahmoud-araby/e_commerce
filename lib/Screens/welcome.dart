import 'package:Login/Screens/products_screen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  goTo() {
    Navigator.pushReplacementNamed(context, ProductsScreen.id);
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) => goTo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
