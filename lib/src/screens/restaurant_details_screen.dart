import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/src/models/restaurant_model.dart';
import 'package:restaurant_app/src/services/restaurant_services.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({ Key? key }) : super(key: key);

  @override
  _RestaurantDetailsScreenState createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    RestaurantResponse restaurant = ModalRoute.of(context)?.settings.arguments as RestaurantResponse;

    final restaurantService = Provider.of<RestaurantServices>(context, listen: false);

    restaurantService.getRestaurant(restaurant.slug.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalles del Restaurante"
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                FadeInImage(
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
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${restaurant.name}",
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                    Container(
                      width: size.width * 0.45,
                      child: Text(
                        "'${restaurant.description}'",
                        maxLines: 3,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${restaurant.rating!.round()}"
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Comentarios",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: restaurant.reviews.length,
                itemBuilder: (BuildContext context, int i) {
                  return Card(
                    elevation: 0.0,
                    child: Container(
                      height: size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${restaurant.reviews[i].comments}"
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${restaurant.reviews[i].rating!.round()}"
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}