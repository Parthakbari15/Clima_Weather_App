import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied || permission==LocationPermission.deniedForever){
      print("Permission Denied");
      LocationPermission askPermission=await Geolocator.requestPermission();
    }
    else{
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude=currentPosition.longitude;
      latitude=currentPosition.latitude;
    }
  }

}