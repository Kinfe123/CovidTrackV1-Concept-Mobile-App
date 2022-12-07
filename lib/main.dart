
import 'package:covidtracker/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/screen/covid_display.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  // initialRoute: '/home',
  // routes: {
  //   '/home': (context) => Home(),
  //   '/home/covid': (context) => CovidDisplay(),
  // },
  home: Home(),
));