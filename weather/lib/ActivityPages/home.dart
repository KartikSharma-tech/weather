// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


void getdata() {

  // process

  Future.delayed(Duration(seconds: 3), () {

   String  Username = "Kartik";

  });



}

void getData() async
{

get("https://mytimeapi.herokuapp.com/time/Asia/Kolkata");
}

  int counter = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Home Activity"),
      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Text(
            "$counter",
            style: TextStyle(fontSize: 40),
          ),

          FloatingActionButton(

            onPressed: () {

              setState(() {

                counter += 1;

              });

            },

            child: Icon(Icons.add),

          ),

        ],

      ),

    );

  }

}