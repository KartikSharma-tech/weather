import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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