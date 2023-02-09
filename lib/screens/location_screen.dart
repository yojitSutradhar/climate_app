import 'package:flutter/material.dart';
import 'package:climate/utilities/constants.dart';
import 'package:climate/services/weather.dart';
import 'package:climate/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final checkdata;
  LocationScreen({this.checkdata});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  String condition;
  String cityname;
  String message;
  var data; //storing the json data
  WeatherModel weather = WeatherModel(); //declare the object of weather.dart to change the Ui
  @override
  initState() {
    super.initState();
    data = widget.checkdata;
    updateUI(data);
  }

  updateUI(var Wdata) {
    setState(() {
      //Temperature of loaction
      double Temp = Wdata['main']['temp'];
      temp = Temp.toInt();
      message = weather
          .getMessage(temp); //return the message according to temp of location

      //Condition of loaction
      var condition1 = Wdata['weather'][0]['id'];
      condition = weather.getWeatherIcon(condition1); //return the icon

      //name of city
      String city = Wdata['name'];
      cityname = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    // updateUI(data);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var place = await weather.getLoactionData();
                      updateUI(place);
                    },
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var city_name = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if(city_name!=null){
                        var data1=await weather.cityData(city_name);
                        updateUI(data1);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temp",
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$condition',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
