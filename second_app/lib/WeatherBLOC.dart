import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:second_app/WeatherRepo.dart';

import './WeatherModel.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final _city;

  FetchWeather(this._city);

  @override
  List<Object> get props => [this._city];
}

class ResetWeather extends WeatherEvent {}

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather {
    return this._weather;
  }

  @override
  List<Object> get props => [this._weather];
}

class WeatherIsNotLoaded extends WeatherState {}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(WeatherState initialState, this.weatherRepo)
      : super(initialState);

  WeatherRepo weatherRepo;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();

      try {
        WeatherModel weather = await this.weatherRepo.getWeather(event._city);
        print(weather.runtimeType);
        yield WeatherIsLoaded(weather);
      } catch (e) {
        yield WeatherIsNotLoaded();
      }
    } else if (event is ResetWeather) {
      yield WeatherIsNotSearched();
    }
  }
}
