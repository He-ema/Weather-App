import 'package:api/models/weather_model.dart';
import 'package:api/pages/search_page.dart';
import 'package:api/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key}); 

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

 WeatherModel? weatherData ;
  @override
  Widget build(BuildContext context) {
  weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
 MaterialPageRoute(builder: (BuildContext context) {
 return SearchPage();
 }));

          }, icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text('There is no weahter ' , style: TextStyle(fontSize: 25),),
            Text('Search for weather' , style: TextStyle(fontSize: 25),),
          ],
        )
      ) : Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          weatherData!.getThemeColor(),
          weatherData!.getThemeColor()[300]!,
          weatherData!.getThemeColor()[100]!,
          
        ],begin: Alignment.topCenter , end: Alignment.bottomCenter
        )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            Text(Provider.of<WeatherProvider>(context).cityName! , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            Text('Updated : ${weatherData!.date}'),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                Text('${weatherData!.temp.toInt()}'),
                Column(
                  children: [
                    Text('Min : ${weatherData!.minTemp.toInt()}'),
                    Text('Max : ${weatherData!.maxTemp.toInt()}'),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Text( weatherData!.weatherStateName , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}