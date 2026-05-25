import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



    void timer(){
      // process - 5 second 
      print("Alarm Is Not  Ringing ");
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // appBar: AppBar(
      //   title: Text("hello"),
      // ),

     body:  Center(
      child: Column(
        children: <Widget>[
          Text("Mousam App"),
          Text("Made By Kartik Sharma")
        ],
      ),
     ),
    );

  }

}