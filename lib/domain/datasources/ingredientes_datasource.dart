import 'package:meal_app/domain/entities/ingrediente.dart';

//metodo para obtener el listado de ingredientes
abstract class IngredientesDatasource { 
  Future<List<Ingrediente>> getIngredientes(); 
}