import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:weather/Package Services/Worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // App Start Hote he 5sec wait then home page pr redirectby context 
  void startApp() async {

  Worker instance =
      Worker(location: "Jaipur");

  await instance.getData();

  print(instance.temp);

  Future.delayed(Duration(seconds: 5), () {

Navigator.pushReplacementNamed(
  context,
  "/home",

  arguments: {

    "temp_value": instance.temp,
    "hum_value": instance.humidity,
    "air_speed_value": instance.air_speed,
    "desc_value": instance.description,
    "main_value": instance.main,
    "icon_value": instance.icon,

  },
);
  });

}


@override
void initState() {
  super.initState();

  startApp();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("hello"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "lib/ActivityPages/assets/images/AppIconImage.jpg",
              width: 120,
              height: 200,
            ),

            Text(
              "Mousam App",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 245, 243, 244),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Made By Kartik Sharma",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 245, 243, 244),
              ),
            ),

            SizedBox(height: 25),
            SpinKitWave(color: Colors.pink, size: 50.0),
          ],
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
