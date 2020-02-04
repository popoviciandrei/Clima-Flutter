import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '9e5498f3a4ffd3aab0ab81031e0d6089';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$apiUrl?'
        'q=$cityName'
        '&units=metric'
        '&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var url = '$apiUrl?'
        'lat=${location.latitude}&lon=${location.longitude}'
        '&units=metric'
        '&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);

    return await networkHelper.getData();
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
