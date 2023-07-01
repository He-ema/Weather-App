import 'package:flutter/material.dart';

class WeatherModel{
   String date ;
   double temp ;
   double minTemp;
   double maxTemp;
   String weatherStateName;
   String icon ;

  WeatherModel({required this.date,required this.temp,required this.minTemp,required this.maxTemp,required this.weatherStateName, required this.icon});

  factory WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(date:  data['location']['localtime'], 
    temp: jsonData['avgtemp_c'], 
    minTemp: jsonData['maxtemp_c'], 
    maxTemp: jsonData['mintemp_c'], 
    weatherStateName: data['current']['condition']['text'],
    icon:data['current']['condition']['icon'] );
  }

  
  String getImage(){
    if(weatherStateName == 'Partly cloudy' || weatherStateName == 'Cloudy' || weatherStateName == 'Partly cloudy'||weatherStateName == 'Patchy rain possible' || weatherStateName == 'Overcast' )
    return 'assets/images/cloudy.png';
    else if(weatherStateName == 'Clear' || weatherStateName =='Sunny'  )
    return 'assets/images/clear.png';    
    else if(weatherStateName == 'Moderate rain' || weatherStateName =='Rain'  )
    return 'assets/images/rainy.png';    
    else if(weatherStateName == 'Snow')
    return 'assets/images/snow.png';
    else if(weatherStateName == 'Thunder' || weatherStateName == 'Thunder storm')
    return 'assets/images/thunderstorm.png';
    else 
    return 'assets/images/clear.png';

  }
  MaterialColor getThemeColor(){
    if(weatherStateName == 'Partly cloudy' || weatherStateName == 'Cloudy' || weatherStateName == 'Partly cloudy'||weatherStateName == 'Patchy rain possible' || weatherStateName == 'Overcast' )
    return Colors.blueGrey;
    else if(weatherStateName == 'Clear' || weatherStateName =='Sunny'  )
    return Colors.orange;    
    else if(weatherStateName == 'Moderate rain' || weatherStateName =='Rain'  )
    return Colors.blueGrey;    
    else if(weatherStateName == 'Snow')
    return Colors.blue;
    else if(weatherStateName == 'Thunder' || weatherStateName == 'Thunder storm')
    return Colors.blueGrey;
    else 
    return Colors.orange;

  }




}

