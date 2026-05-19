import 'package:flutter/material.dart';
import 'package:weather/ActivityPages/home.dart';
import 'package:weather/ActivityPages/loading.dart';
import 'package:weather/ActivityPages/location.dart'; 



void main() {
  runApp( MaterialApp(
    routes: {
      "/":(context)=> Loading(),
      "/home":(context)=>Home(),
    },
   ));
}