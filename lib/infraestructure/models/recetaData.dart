import 'package:meal_app/infraestructure/models/recetaResponse.dart';

class RecetaData {
  final String idMeal;
  final String strMeal; //nombre de la receta
  final String strCategory; //categoria
  final String strArea; //pais o lugar
  final String  strInstructions; //instrucciones
  final String strMealThumb; //imagen
  final String  strTags; //etiquetas
  final String strYoutube; //video
  final List<IngredientResponse>  ingredients; //son 20 ingredientes y su medida

  RecetaData({
    required this.idMeal,
     required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
   required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.ingredients
  });

    factory RecetaData.fromJson(Map<String, dynamic> json) => RecetaData(
    idMeal: json["idMeal"] ?? '',
    strMeal: json["strMeal"] ?? '',
    strCategory: json["strCategory"] ?? '',
    strArea: json["strArea"] ?? '',
    strInstructions: json["strInstructions"] ?? '',
    strMealThumb: json["strMealThumb"] ?? 'assets/default_image.png',
    strTags: json["strTags"] ?? '',
    strYoutube: json["strYoutube"] ?? '',

    ingredients: List<IngredientResponse>.generate(20, (index) 
    {
      final ingredient = json["strIngredient${index + 1}"] ?? "";
      final measure = json["strMeasure${index + 1}"] ?? "";

      return IngredientResponse(strIngredient: ingredient, strMeasure: measure);

    }).where((i) => i.strIngredient.isNotEmpty).toList(), 
  );

  Map<String, dynamic> toJson() => {
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strCategory": strCategory,
    "strArea": strArea,
    "strInstructions": strInstructions,
    "strMealThumb": strMealThumb,
    "strTags": strTags,
    "strYoutube": strYoutube,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson()))
  };
}



