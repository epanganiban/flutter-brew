import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
    String url = '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    return await networkHelper.getData();
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
    String url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    return await networkHelper.getData();
  }
}
