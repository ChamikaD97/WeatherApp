import 'package:flutter/material.dart';
import 'widget_test.dart';

class MainWidget extends StatelessWidget {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  MainWidget(
      {@required this.location,
      @required this.humidity,
      @required this.temp,
      @required this.tempMax,
      @required this.windSpeed,
      @required this.tempMin,
      @required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          color: Color(0xf111111f),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              " ${location.toString()}",
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  " ${((temp.toInt() - 32) * 5/9 ).toStringAsFixed(1)}°C",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                " High ${((tempMin.toInt() - 32) * 5/9).toStringAsFixed(1) } °C - Low ${((tempMax.toInt() - 32) * 5/9).toStringAsFixed(1) } °C",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: [
              WeatherTile(
                  icon: Icons.thermostat_outlined,
                  title: "Temperature",
                  subtitle: " ${((temp.toInt() - 32) * 5/9).toStringAsFixed(1)}°C"),
              WeatherTile(
                  icon: Icons.cloud_outlined,
                  title: "Weather",
                  subtitle: " ${weather.toString()}"),
              WeatherTile(
                  icon: Icons.wb_sunny,
                  title: "Humidity",
                  subtitle:" ${humidity.toInt().toString()} %",),
              WeatherTile(
                  icon: Icons.waves_outlined,
                  title: "Wind Speed",
                  subtitle: " ${windSpeed.toString()} MPH"),
            ],
          ),
        ))
      ],
    );
  }
}
