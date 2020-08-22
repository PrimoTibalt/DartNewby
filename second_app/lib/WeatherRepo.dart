import 'package:http/http.dart' as http;
import 'package:second_app/WeatherModel.dart';
import 'dart:convert';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=6ba3c4cf17198d6de81a5d0a8c67f3ca');
    if (result.statusCode != 200) {
      throw Exception();
    }

    return parseJson(result.body);
  }

  WeatherModel parseJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded['main'];
    return WeatherModel.fromJson(jsonWeather);
  }
}
