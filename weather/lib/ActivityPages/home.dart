import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String weatherMain = info['main_value'];
    IconData weatherIcon = Icons.sunny;

    if (weatherMain == "Clouds") {
      weatherIcon = Icons.cloud;
    } else if (weatherMain == "Rain") {
      weatherIcon = Icons.umbrella;
    } else if (weatherMain == "Thunderstorm") {
      weatherIcon = Icons.flash_on;
    } else if (weatherMain == "Snow") {
      weatherIcon = Icons.ac_unit;
    } else if (weatherMain == "Mist") {
      weatherIcon = Icons.foggy;
    }
    String icon = info['icon_value'];
    // String icon = "03d";
    // String icon = info['icon_value'];
    print(icon);
    var cityName = ["Bhilwara", "Amhedbad", "London", "Ugenda"];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];

    print(info['temp_value']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.wb_sunny),
            SizedBox(width: 10),
            Text("Weather Forecast"),
          ],
        ),

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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
              ),
            ),
            child: Column(
              children: [
                Container(
                  // Search Wala Container
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  margin: EdgeInsets.fromLTRB(20, 25, 20, 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (searchcontroller.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please Enter City Name")),
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              "/loading",
                              arguments: {"searchText": searchcontroller.text},
                            );
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),

                      Expanded(
                        child: TextField(
                          controller: searchcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search  $city...",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 93, 93, 93),
                              fontSize: 18,
                            ),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withValues(alpha: 0.25),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(25),
                        child: Row(
                          children: [
                            // Image.network("image insert"),
                            // Ye link weather Auto icon k liyee h
                            // Image.network(
                            //   "https://openweathermap.org/img/wn/$icon@2x.png",
                            //   width: 90,
                            //   height: 120,
                            // ),
                            Icon(weatherIcon, size: 65, color: Colors.orange.shade700),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${info['desc_value']}",
                                  
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "📍 ${info['city_value']}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // height: 100,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(31, 244, 228, 228),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thermostat,
                              color: const Color.fromARGB(255, 15, 9, 9),
                              size: 55,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${info['temp_value']}°C",

                                  style: TextStyle(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // height: 100,
                      ),
                    ),
                  ],
                ),

                Row(
                  // Ye Row H 2no box k liye sath vale Dholu Bholu
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 150,

                        // first box stttt
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.air, color: Colors.white, size: 35),
                              ],
                            ),

                            SizedBox(height: 10),

                            Text(
                              "${info['air_speed_value']}Km/hr",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        // first box endddd
                      ),
                    ),
                    Expanded(
                      // Second box stttt
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.water_drop,
                                  color: Colors.white,
                                  size: 45,
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            Text(
                              "${info['hum_value']}%",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Second box Enddddddd///
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
