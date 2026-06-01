import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;

  //Constructor

  Worker({required this.location});

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;
  String? cityName;

  //method
  Future<void> getData() async {
    try {
      Response response = await get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=e34a5eb0b4c5ff748fdf9219a63d224e",
        ),
      );
      Map data = jsonDecode(response.body);
      if (data["cod"] != 200) {
  throw Exception("City Not Found");
}
      cityName = data["name"];

      print(data);
      //Getting Temp,Humidity
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'].toDouble();
      //Getting air_speed
      Map wind = data['wind'];
      String getairSpeed = (wind["speed"] / 0.27777777777778).toStringAsFixed(
        2,
      );
      //Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getmainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];
      // String icon = weatherMainData["icon"];

      //Assigning Values
      temp = getTemp.toStringAsFixed(2); //C
      humidity = getHumidity; // %
      air_speed = getairSpeed.toString(); //km/hr
      description = getDesc;
      main = getmainDes;
      icon = weatherMainData["icon"].toString();
    } catch (e) {
      print(e);
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "City Not Found";
      main = "NA";
      icon = "03n";
    }
  }
}
