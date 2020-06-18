import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apikey = '3e78bbf58b39dc9f5048a8150bc716e4';
const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeahter(String cityName) async {
    //
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openweathermapurl?q=$cityName&appid=$apikey&units=metric');
    var weatherDate = await networkHelper.getData();
    return weatherDate;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getcurrentLocations();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openweathermapurl?lat=${location.latitude}&lon=${location.longtitude}&appid=$apikey&units=metric');
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
