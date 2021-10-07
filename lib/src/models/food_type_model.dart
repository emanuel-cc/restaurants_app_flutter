// To parse this JSON data, do
//
//     final foodTypesResponse = foodTypesResponseFromMap(jsonString);

import 'dart:convert';

List<FoodTypesResponse> foodTypesResponseFromMap(String str) => List<FoodTypesResponse>.from(json.decode(str).map((x) => FoodTypesResponse.fromMap(x)));

String foodTypesResponseToMap(List<FoodTypesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class FoodTypesResponse {
    FoodTypesResponse({
        this.slug,
        this.name,
    });

    String? slug;
    String? name;

    factory FoodTypesResponse.fromMap(Map<String, dynamic> json) => FoodTypesResponse(
        slug: json["slug"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "slug": slug,
        "name": name,
    };
}

