import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



    void timer(){
      // process - 5 second 
      print("Alarm Ia Ringing ");
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // appBar: AppBar(
      //   title: Text("hello"),
      // ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          // Text(
          //   "Weather App",
          //   style: TextStyle(fontSize: 30),
          // ),

          SizedBox(height: 20),

          ElevatedButton.icon(

            onPressed: () {

              Navigator.pushNamed(context, "/home");

            },

            icon: Icon(Icons.home),

            label: Text("Go To Home"),

          ),

        ],

      ),

    );

  }

}