import 'package:flutter/material.dart';

import 'package:wetterapp/constants/constants.dart';
import 'package:wetterapp/constants/weather.dart';
import '../Services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({Key? key, required this.locationWeather})
      : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late String weatherMessage;
  late String weatherIcon;
  late int temp;
  late int weatherDescription;
  late String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
  setState(() {
      double tempt = weatherData['main']['temp'];
    temp = tempt.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage=weather.getMessage(temp);
    cityName = weatherData['name'];
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(actions: [
 FlatButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
    ],),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('lib/assets/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temp',
                      style: kTempTextStyle,
                    ),
                    
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Text(
                  "in $cityName",
                  style: kMessageTextStyle,
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  weatherMessage,
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
