import 'package:flutter/material.dart';
import 'widgets/main_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async {
  final zipCode = "00400";

  final requestUrl = "http://api.openweathermap.org/data/2.5/weather?zip=" +
      zipCode +
      ",lk&units=imperial&appid=23a5428a4a0f9da03c7c62b493337c80";

  final response = await http.get(Uri.parse(requestUrl));
  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Eror");
  }
}

class WeatherInfo {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  WeatherInfo(
      {@required this.location,
      @required this.humidity,
      @required this.temp,
      @required this.tempMax,
      @required this.windSpeed,
      @required this.tempMin,
      @required this.weather});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        humidity: json['main']['humidity'],
        temp: json['main']['temp'],
        tempMax: json['main']['temp_max'],
        windSpeed: json['wind']['speed'],
        tempMin: json['main']['temp_min'],
        weather: json['weather'][0]['description']);
  }
}

void main() => runApp(MaterialApp(title: "Weather App", home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  Future<WeatherInfo> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<WeatherInfo>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainWidget(
                    location: snapshot.data.location,
                    humidity: snapshot.data.humidity,
                    temp: snapshot.data.temp,
                    tempMax: snapshot.data.tempMax,
                    tempMin: snapshot.data.tempMin,
                    weather: snapshot.data.weather,
                    windSpeed: snapshot.data.windSpeed);
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
              return CircularProgressIndicator();
            }));
  }
}
