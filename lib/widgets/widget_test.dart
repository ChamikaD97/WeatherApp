import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;

  WeatherTile(
      {@required this.icon, @required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
          ),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle,
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w300)),
    );
  }
}
