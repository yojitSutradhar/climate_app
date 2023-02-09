import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const api = 'd20ddbbaf9f9a0b8a97c23a8b98afd21';

class WeatherModel {
  Future<dynamic> cityData(String cityname) async {
    String Url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$api&units=metric";
    networkdata cityByName = networkdata(Url);
    var cityWeather = await cityByName.climatedata();
    print(cityWeather);
    return cityWeather;
  }

  Future<dynamic> getLoactionData() async {
    //work of this function getting the coordinate of location and give the info of the weather
    var loc =
        location(); //declare the var of class from which we import from another dart file
    double longitiitude;
    double latitude;

    await loc
        .getposition(); //by using this function we taking the the cordinaties of location
    latitude = loc.latitude;
    longitiitude = loc.longititude;
    networkdata climaData = networkdata(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitiitude&appid=$api&units=metric'); //we are passing the api url by using parameter of longi and aliti and its obj of class having a url as parameter
    var wheatherData = await climaData
        .climatedata(); //we are getting the weatehr data(json data) form api
    print(wheatherData);
    return wheatherData; //return weather data(json data)
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
