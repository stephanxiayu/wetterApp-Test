
import 'package:wetterapp/Services/location.dart';
import 'package:wetterapp/Services/networking.dart';

const ApiKey = "eded64094ee170213ef960157d24a15f";
const openWeathermap= "http://api.openweathermap.org/data/2.5/weather";
class WeatherModel {

Future <dynamic> getCityWeather(String cityName)async{

  var url="$openWeathermap?q=$cityName&appid=$ApiKey&units=metric";
  NetworkHelper networkHelper=NetworkHelper(url);
var weatherData= await networkHelper.getData();
return weatherData;
}


Future<dynamic> getLocationWeather()async{
   Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeathermap?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKey&units=metric");
    var weatherData = await networkHelper.getData();
return weatherData;
}




  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int tempu) {
    if (tempu > 25) {
      return 'It\'s 🍦 time';
    } else if (tempu > 20) {
      return 'Zeit für kurze Hosen und 👕';
    } else if (tempu < 10) {
      return 'Du brauchst 🧣 und 🧤';
    } else {
      return 'Bring ein 🧥 zur Sicherheit mit';
    }
  }
}