import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/Package Services/Worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  String searchCity = "Bhilwara";
  bool hasStarted = false;

  void startApp() async {
    print("City = $searchCity");

    Worker instance = Worker(location: searchCity);

    await instance.getData();

    print(instance.temp);

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
        "city_value": instance.cityName,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null) {
      Map searchData = args as Map;

      if (searchData["searchText"] != null &&
          searchData["searchText"].toString().isNotEmpty) {
        searchCity = searchData["searchText"];
      }
    }

    if (!hasStarted) {
      hasStarted = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        startApp();
      });
    }

    return Scaffold(
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
                color: Color.fromARGB(255, 245, 243, 244),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Made By Kartik Sharma",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 245, 243, 244),
              ),
            ),
            SizedBox(height: 25),
            SpinKitWave(
              color: Colors.pink,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
