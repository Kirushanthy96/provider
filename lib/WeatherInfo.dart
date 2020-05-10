import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier{
  String _Temptype="celcius";
  int _TemperatureValue=25;

  int get tempratureValue=>_TemperatureValue;
  String get temperatureType=>_Temptype;

  set temperature(int newtemp){
    _TemperatureValue=newtemp;
    notifyListeners();
  }

  set temperatureType(String newType){
    _Temptype=newType;
    notifyListeners();
  }
}