import 'package:clima_weather/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData,),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.green,
          size: 100.0,
        ),
        // child: RaisedButton(
        //   onPressed: () {
        //     getLocationData();
        //   },
        //   child: Text('Get Location'),
        // ),
      ),
    );
  }
}
