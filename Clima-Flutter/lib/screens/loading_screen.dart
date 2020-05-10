import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';
import 'dart:convert';
import 'package:clima/services/networking.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();

  }

  void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData= await weatherModel.getLocationWeather();

  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherData,);
  }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
