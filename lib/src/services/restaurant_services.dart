import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/src/models/food_type_model.dart';
import 'package:restaurant_app/src/models/restaurant_model.dart';

class RestaurantServices extends ChangeNotifier{

  String urlBase = "tellurium.behuns.com";
  List<FoodTypesResponse> foodTypes = [];
  List<RestaurantResponse> restaurants = [];
  RestaurantResponse? restaurant;


  Future<List<FoodTypesResponse>> getFoodType()async{
    final url = Uri.https(urlBase, '/api/food_types/');
    final res = await http.get(
      url
    );
    // List<dynamic> decodedResp = json.decode(res.body);

    foodTypes = foodTypesResponseFromMap(res.body);
    // print(decodedResp);
    notifyListeners();
    return foodTypes;
  }

  Future<List<RestaurantResponse>> getRestaurants(String slug)async{
    final url = Uri.https(urlBase, '/api/restaurants/');
    final res = await http.get(
      url,
      headers: {
        "food_type__slug": slug
      }
    );
    restaurants = restaurantResponseFromMap(res.body);
    // print(restaurants);
    notifyListeners();
    return restaurants;
  }

  Future<RestaurantResponse> getRestaurant(String slug)async{
    final url = Uri.https(urlBase, '/api/restaurants/$slug');
    final res = await http.get(
      url
    );
    final restaurantRes = RestaurantResponse.fromMap(json.decode(res.body));
    print(restaurant);
    restaurant = restaurantRes;
    return restaurant!;
  }
}