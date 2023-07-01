import 'dart:convert';

import 'package:api/models/weather_model.dart';
import 'package:http/http.dart' as http; 


class WeatherService{

  String BaseUrl = 'http://api.weatherapi.com/v1';
  String key = 'c481cfaa5c6d4b89a51130639231804';
  Future<WeatherModel?> getWeather({required String cityName})async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse('$BaseUrl/forecast.json?key=$key&q=$cityName&days=1');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    var JsonData = data['forecast']['forecastday'][0];

    weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weather ;
  }
}