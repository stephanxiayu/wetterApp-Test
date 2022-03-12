class WeatherModel {
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