import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/src/models/food_type_model.dart';
import 'package:restaurant_app/src/services/restaurant_services.dart';
import 'package:restaurant_app/src/widgets/restaurant_card.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({ Key? key }) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    FoodTypesResponse foodType = ModalRoute.of(context)?.settings.arguments as FoodTypesResponse;

    final restaurantServices = Provider.of<RestaurantServices>(context, listen: true);

    restaurantServices.getRestaurants(foodType.slug.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurantes"
        ),
      ),
      body: (restaurantServices.restaurants.isEmpty)
        ? Center(
          child: CircularProgressIndicator(),
        )
        :ListView.builder(
          itemCount: restaurantServices.restaurants.length,
          itemBuilder: (BuildContext context, int i) {
            return RestaurantCard(restaurant: restaurantServices.restaurants[i]);
          },
        ),
    );
  }
}