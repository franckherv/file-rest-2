import 'package:climat/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climat/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  final Position position;

  const LocationScreen({Key key, this.position}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temp;
  var city;
  var sentence;
  var icon;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${widget.position.latitude}&lon=${widget.position.longitude}&appid=e7a9e30aa70ad4da4f1c4505c1409e99&units=metric#');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        var data = jsonDecode(response.body);
      temp = data["main"]["temp"];
      city = data["name"];
      var condition = temp.toInt();
      icon = WeatherModel().getWeatherIcon(condition);
      sentence = WeatherModel().getMessage(condition);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temp.toString()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon.toString(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's $sentence time in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
