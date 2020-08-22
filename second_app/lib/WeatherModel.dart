class WeatherModel {
  final _temp;
  final pressure;
  final _minTemp;
  final _maxTemp;
  final humidity;

  double get getTemp {
    return _temp - 272.5;
  }

  double get getMinTemp {
    return _minTemp - 272.5;
  }

  double get getMaxTemp {
    return _maxTemp - 272.5;
  }

  WeatherModel(
      this._temp, this.pressure, this._minTemp, this._maxTemp, this.humidity);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(json['temp'], json['pressure'], json['temp_min'],
        json['temp_max'], json['humidity']);
  }
}
