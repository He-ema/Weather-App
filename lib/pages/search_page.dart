import 'package:api/models/weather_model.dart';
import 'package:api/provider/weather_provider.dart';
import 'package:api/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {

String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (data) {
                  cityName = data ;
                },
                onSubmitted: (data) async {
                  cityName = data ;
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context , listen: false).weatherData = weather;
                   Provider.of<WeatherProvider>(context , listen: false).cityName = cityName;
                  Navigator.pop(context);
                  
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a City ',
                  labelText: 'City',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () async {
              WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context , listen: false).weatherData = weather;
                   Provider.of<WeatherProvider>(context , listen: false).cityName = cityName;
                  Navigator.pop(context);
            }, child: Text('Search'))
                      ],
        ),
      ),
    );
  }
}


