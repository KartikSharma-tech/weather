import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String weatherMain = info['main_value'];
   IconData weatherIcon = Icons.sunny;

if (weatherMain == "Clouds") {
  weatherIcon = Icons.cloud;
}
else if (weatherMain == "Rain") {
  weatherIcon = Icons.umbrella;
}
else if (weatherMain == "Thunderstorm") {
  weatherIcon = Icons.flash_on;
}
else if (weatherMain == "Snow") {
  weatherIcon = Icons.ac_unit;
}
else if (weatherMain == "Mist") {
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
                          print("searchcontroller.Text");
                          Navigator.pushNamed(context, "/loading", arguments:  {
                            "searchText":searchcontroller.text,
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: Icon(Icons.search, color: Colors.blue),
                        ),
                      ),

                      Expanded(
                        child: TextField(
                          controller: searchcontroller,
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
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(50),
                        child: Row(
                          children: [
                            // Image.network("image insert"),
                            // Ye link weather Auto icon k liyee h
                            // Image.network(
                            //   "https://openweathermap.org/img/wn/$icon@2x.png",
                            //   width: 90,
                            //   height: 120,
                            // ),
                            Icon(weatherIcon, size: 90, color: Colors.orange),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${info['desc_value']}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "In Bhilwara",
                                  style: TextStyle(
                                    fontSize: 20,
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
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.thermostat,
                              color: const Color.fromARGB(255, 15, 9, 9),
                              size: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${info['temp_value']}°C",

                                  style: TextStyle(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w500,
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
                          borderRadius: BorderRadius.circular(12),
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
                          borderRadius: BorderRadius.circular(12),
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
                                  size: 35,
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
