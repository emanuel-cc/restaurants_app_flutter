import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/src/screens/food_type_screen.dart';
import 'package:restaurant_app/src/screens/restaurant_details_screen.dart';
import 'package:restaurant_app/src/screens/restaurants_screen.dart';
import 'package:restaurant_app/src/services/restaurant_services.dart';

void main() => runApp(Appstate());

class Appstate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>RestaurantServices(),
          lazy: true,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      initialRoute: "tipocomida",
      routes: {
        "tipocomida"  : (BuildContext context) => FoodTypeScreen(),
        "restaurantes": (BuildContext context) => RestaurantScreen(),
        "details"     : (BuildContext context) => RestaurantDetailsScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.orange
        )
      ),
    );
  }
}