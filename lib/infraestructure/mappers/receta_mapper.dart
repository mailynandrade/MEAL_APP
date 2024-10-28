import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/infraestructure/models/recetaData.dart';

class RecetaMapper {
  static Receta recetaToEntity(RecetaData data) => Receta(
        idMeal: data.idMeal,
        strMeal: data.strMeal,
        strCategory: data.strCategory,
        strArea: data.strArea,
        strInstructions: data.strInstructions,
        strMealThumb: data.strMealThumb,
        strTags: data.strTags,
        strYoutube: data.strYoutube,
        ingredients: data.ingredients.map((ingredientResponse) => Ingredient(
                      strIngredient: ingredientResponse.strIngredient,
                      strMeasure: ingredientResponse.strMeasure,
                    ))
                .toList(), // Manejo de null
      );
}


