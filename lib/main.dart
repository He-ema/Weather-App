import 'package:api/models/weather_model.dart';
import 'package:api/pages/home_page.dart';
import 'package:api/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
   create: (context){
        return WeatherProvider();
      },
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

