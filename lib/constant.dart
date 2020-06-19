import 'package:flutter/material.dart';

const user = TextStyle(
  fontSize: 20,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final bodyDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
    colors: [
      Colors.deepOrange[300],
      Colors.deepOrange[400],
      Colors.deepOrange[500],
      Colors.deepOrange[600],
      Colors.deepOrange[700],
    ],
  ),
);
