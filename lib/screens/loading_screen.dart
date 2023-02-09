import 'package:flutter/material.dart';
import 'package:climate/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate/services/weather.dart';

const api = 'd20ddbbaf9f9a0b8a97c23a8b98afd21';

class Live_locaation extends StatefulWidget {
  @override
  State<Live_locaation> createState() => _Live_locaationState();
}

class _Live_locaationState extends State<Live_locaation> {
  @override
  initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var wheatherData = await WeatherModel().getLoactionData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
          checkdata:
              wheatherData); //we are passing the json data to another class
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Climate App"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
