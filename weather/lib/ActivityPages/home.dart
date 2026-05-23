import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int counter = 1;
var temp;
  @override
void initState() {

  super.initState();

  getData();

}

  void getData() async {

    Response response = await get(

      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Jaipur&units=metric&appid=d8d0a47d5c3d846d88fb71fd9167c6db",
      ),

    );

    Map data = jsonDecode(response.body);

    Map tempData = data['main'];

temp = tempData['temp'];
    print(temp);

  }

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
            "Weather Loading...",
                style: TextStyle(fontSize: 25),
            ),

          FloatingActionButton(

            onPressed: () {

              setState(() {

                counter += 1;

              });

            },

            child: Icon(Icons.add),
LORE
          ),

        ],

      ),

    );

  }

}