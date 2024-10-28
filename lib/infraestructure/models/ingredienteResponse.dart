import 'dart:convert';
import 'package:meal_app/infraestructure/models/ingredienteData.dart';

IngredienteResponse ingredienteResponseFromJson(String str) => IngredienteResponse.fromJson(json.decode(str));

String ingredienteResponseToJson(IngredienteResponse data) => json.encode(data.toJson());

class IngredienteResponse {
    final List<IngredienteData> meals;

    IngredienteResponse({
        required this.meals,
    });

    factory IngredienteResponse.fromJson(Map<String, dynamic> json) => IngredienteResponse(
        meals: List<IngredienteData>.from(json["meals"].map((x) => IngredienteData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
    };
}