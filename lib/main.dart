import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/WeatherInfo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return ChangeNotifierProvider(
          builder: (context)=>WeatherInfo(),
            child:Scaffold(
        appBar: AppBar(
          title: Text("provider pattern"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySpecialHeading(),
              MySpecialContent(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
        );
    }
  }

class MySpecialHeading extends StatelessWidget {

   Color decideColor(WeatherInfo info) {
     return info.temperatureType=="celcius"?Colors.green:Colors.deepOrange;
     }
  @override
  Widget build(BuildContext context) {
    var weatherInfo= Provider.of<WeatherInfo>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child:Consumer<WeatherInfo>(builder:(context,weatherInfo,_)=>Text(weatherInfo.temperatureType,style: TextStyle(fontSize:25,color:decideColor(weatherInfo)),),
      ));
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Temperature Value"),
    );
  }
}


class MyFloatingActionButton extends StatelessWidget {

  Color decideColor(WeatherInfo info){
    return info.temperatureType=="celcius"?Colors.blue:Colors.indigo;
  }

  @override                                                           
  Widget build(BuildContext context) {

     var weatherInfo= Provider.of<WeatherInfo>(context);
     
    return FloatingActionButton(
      backgroundColor:decideColor(weatherInfo),
      onPressed: (){
        String newWeathertype=   weatherInfo.temperatureType=="celcius"?"far":"celcius";
         weatherInfo.temperatureType=newWeathertype;
      },
      tooltip: 'change type',
      child: Icon(Icons.change_history),
    );
  }
}

