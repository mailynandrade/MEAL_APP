import 'package:meal_app/domain/entities/ingrediente.dart';

//metodo para obtener el listado de ingredientes
abstract class IngredientesRepository { 
  Future<List<Ingrediente>> getIngredientes(); 
}