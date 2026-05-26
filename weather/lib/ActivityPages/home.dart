import 'dart:convert';
import 'dart:math';

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

    setState(() {
      temp = tempData['temp'];
    });
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Bhilwara", "Amhedbad", "London", "Ugenda"];
    final random = Random();
    var city = city_name[random.nextInt(city_name.length)];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Weather App"),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 242, 163, 6),
                const Color.fromARGB(255, 234, 230, 230),
                const Color.fromARGB(255, 54, 239, 3),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 101, 186, 229),
            child: Column(
              children: [
                Container(
                  // Search Wala Container
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Search Me");
                        },
                        child: Container(
                          child: Icon(Icons.search, color: Colors.blue),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),

                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search  $city",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(50),
                        child: Row(
                          children: [
                            // Image.network("image insert"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Bad Weather....", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                              Text("In Bhilwara",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            )
                          ],
                        ),

                        // height: 100,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(50),
                        child: Text("hh"),

                        // height: 100,
                      ),
                    ),
                  ],
                ),

                Row(
                  // Ye Row H 2no box k liye sath vale 50-50
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Text("hh"),
                        height: 150,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        child: Text("h2"),
                        height: 150,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Kartik"),
                      Text("Data Provided By Kartik's Weather App"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
