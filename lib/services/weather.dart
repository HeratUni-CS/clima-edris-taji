import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'Cloudy';
    } else if (condition < 400) {
      return 'Cloudy';
    } else if (condition < 600) {
      return 'Rainy';
    } else if (condition < 700) {
      return 'Snowy';
    } else if (condition < 800) {
      return 'windy';
    } else if (condition == 800) {
      return 'Sunny';
    } else if (condition <= 804) {
      return 'Foggy';
    } else {
      return 'Snezy';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s cool time';
    } else if (temp > 20) {
      return 'Time for shorts and hot';
    } else if (temp < 10) {
      return 'You\'ll need snezy and cool';
    } else {
      return 'Bring a jacet just in case';
    }
  }
}
