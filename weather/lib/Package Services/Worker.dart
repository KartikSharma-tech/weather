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

  //method
  Future<void> getData() async {
    try {
      Response response = await get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=e34a5eb0b4c5ff748fdf9219a63d224e",
        ),
      );
      Map data = jsonDecode(response.body);

      print(data);
      //Getting Temp,Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'].toDouble();
      //Getting air_speed
      Map wind = data['wind'];
      String getAir_speed = (wind["speed"] / 0.27777777777778).toStringAsFixed(
        2,
      );
      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      //Assigning Values
      temp = getTemp.toStringAsFixed(2); //C
      humidity = getHumidity; // %
      air_speed = getAir_speed.toString(); //km/hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();
    } catch (e) {
      print(e);
      temp = "Can't Find Data";
      humidity = "Can't Find Data";
      air_speed = "Can't Find Data";
      description = "Can't Find Data";
      main = "Can't Find Data";
      icon = "03n";
    }
  }
}
