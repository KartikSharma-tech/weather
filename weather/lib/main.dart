import 'package:flutter/material.dart';
import 'package:weather/ActivityPages/home.dart';
import 'package:weather/ActivityPages/loading.dart';



void main() {
  runApp( MaterialApp(
    routes: {
      "/":(context)=> Loading(),
      "/home":(context)=>Home(),
      "/loading": (context) => Loading()
    },
   ));
}