import 'package:flutter/material.dart';
import 'package:time_window/pages/choose_location.dart';
import 'package:time_window/pages/loading.dart';
import 'package:time_window/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
