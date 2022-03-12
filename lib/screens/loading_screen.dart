import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wetterapp/Services/location.dart';
import 'package:wetterapp/Services/networking.dart';
import 'package:wetterapp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GeolocatorService {
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }
}

const ApiKey = "eded64094ee170213ef960157d24a15f";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    currentLocationData();
  }

  void currentLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKey&units=metric");
    var weatherData = await networkHelper.getData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(locationWeather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
