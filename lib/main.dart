import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movemate/app.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MoveMateApp());
  });
}
