import 'package:geolocator/geolocator.dart';

class LocationDetail {
  double latitude;
  double longitude;

 Future <void> getAppPosition() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    } 
  }
}
