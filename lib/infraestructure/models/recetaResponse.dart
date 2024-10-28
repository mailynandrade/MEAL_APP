import 'dart:convert';
import 'package:meal_app/infraestructure/models/recetaData.dart';

class RecetaResponse {
  final List<RecetaData> meals;

  RecetaResponse recetaResponseFromJson(String str) =>
      RecetaResponse.fromJson(json.decode(str));

  String recetaResponseToJson(RecetaResponse data) =>
      json.encode(data.toJson());

  RecetaResponse({
    required this.meals,
  });

  factory RecetaResponse.fromJson(Map<String, dynamic> json) => RecetaResponse(
        meals: List<RecetaData>.from(
            json["meals"].map((x) => RecetaData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };

  /*static RecetaResponse recetaResponseFromJson(String str) =>
      RecetaResponse.fromJson(json.decode(str));*/
}

class IngredientResponse {
  final String strIngredient; // nombre del ingrediente
  final String strMeasure; // medida del ingrediente

  IngredientResponse({
    required this.strIngredient,
    required this.strMeasure,
  });

  factory IngredientResponse.fromJson(Map<String, dynamic> json) =>
      IngredientResponse(
          strIngredient: json["strIngredient"] ?? '',
          strMeasure: json["strMeasure"]);

  Map<String, dynamic> toJson() => {
        "strIngredient": strIngredient,
        "strMeasure": strMeasure,
      };
}
