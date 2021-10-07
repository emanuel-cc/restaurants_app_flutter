import 'package:flutter/material.dart';
import 'package:restaurant_app/src/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantResponse restaurant;
  const RestaurantCard({ required this.restaurant });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "details", arguments: restaurant);
      },
      child: Card(
        child: Container(
          width: size.width * 0.6,
          height: size.height * 0.2,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: NetworkImage(
                    "https://c.tenor.com/Tu0MCmJ4TJUAAAAC/load-loading.gif"
                  ), 
                  image: NetworkImage(
                    "${restaurant.logo}"
                  ),
                  fit: BoxFit.fill,
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Text(
                "${restaurant.name}"
              )
            ],
          ),
        ),
      ),
    );
  }
}