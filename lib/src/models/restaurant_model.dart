// To parse this JSON data, do
//
//     final restaurantResponse = restaurantResponseFromMap(jsonString);

import 'dart:convert';

List<RestaurantResponse> restaurantResponseFromMap(String str) => List<RestaurantResponse>.from(json.decode(str).map((x) => RestaurantResponse.fromMap(x)));

String restaurantResponseToMap(List<RestaurantResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RestaurantResponse {
    RestaurantResponse({
        this.slug,
        this.name,
        this.description,
        this.logo,
        this.rating,
      required  this.foodType,
      required  this.reviews,
    });

    String? slug;
    String? name;
    String? description;
    String? logo;
    double? rating;
    List<String> foodType;
    List<Review> reviews;

    factory RestaurantResponse.fromMap(Map<String, dynamic> json) => RestaurantResponse(
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        foodType: List<String>.from(json["food_type"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "slug": slug,
        "name": name,
        "description": description,
        "logo": logo,
        "rating": rating == null ? null : rating,
        "food_type": List<dynamic>.from(foodType.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
    };
}

class Review {
    Review({
        this.slug,
        this.restaurant,
        this.email,
        this.comments,
        this.rating,
      required  this.created,
    });

    String? slug;
    String? restaurant;
    String? email;
    String? comments;
    int? rating;
    DateTime created;

    factory Review.fromMap(Map<String, dynamic> json) => Review(
        slug: json["slug"],
        restaurant: json["restaurant"],
        email: json["email"],
        comments: json["comments"] == null ? null : json["comments"],
        rating: json["rating"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toMap() => {
        "slug": slug,
        "restaurant": restaurant,
        "email": email,
        "comments": comments == null ? null : comments,
        "rating": rating,
        "created": created.toIso8601String(),
    };
}
