import 'package:flutter/material.dart';
import 'package:avril_2/services/location.dart';
import 'package:avril_2/services/networking.dart';
import 'location_screen.dart';

const apiKey = 'cfef084c76b52f1adb32b52bd0b1120a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    LocationDetail location = LocationDetail();
    await location.getAppPosition();
    latitude = location.latitude;
    longitude = location.longitude;
    

    NetworkHelper networkHelper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&$apiKey");

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
