import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void timer() {
    // process - 5 second
    print("Alarm Is Not  Ringing ");
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
