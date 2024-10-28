//los datos pueden ser nulos ya que no todos los registros los contienen
class Receta {
  final String idMeal;
  final String strMeal; //nombre de la receta
  final String strCategory; //categoria
  final String  strArea; //pais o lugar
  final String  strInstructions; //instrucciones
  final String strMealThumb; //imagen
  final String  strTags; //etiquetas
  final String strYoutube; //video
  final List<Ingredient>  ingredients; //son 20 ingredientes y su medida

  Receta({
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

}

class Ingredient {
  final String ? strIngredient; //nombre del ingrediente
  final String ? strMeasure; //medida del ingrediente

  Ingredient({
    this.strIngredient, 
    this.strMeasure});
}
