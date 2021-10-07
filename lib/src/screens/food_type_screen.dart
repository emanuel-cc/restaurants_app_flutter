import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/src/services/restaurant_services.dart';

class FoodTypeScreen extends StatefulWidget {
  const FoodTypeScreen({ Key? key }) : super(key: key);

  @override
  _FoodTypeScreenState createState() => _FoodTypeScreenState();
}

class _FoodTypeScreenState extends State<FoodTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final foodServices = Provider.of<RestaurantServices>(context);

    foodServices.getFoodType();
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants App'),
      ),
      body: (foodServices.foodTypes.isEmpty)
        ? Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
        : SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Selecciona el tipo de comida",
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.84,
                child: ListView.builder(
                  itemCount: foodServices.foodTypes.length,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "restaurantes", arguments: foodServices.foodTypes[i]);
                      },
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: Card(
                          child: Center(
                            child: Text(
                              "${foodServices.foodTypes[i].name}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}