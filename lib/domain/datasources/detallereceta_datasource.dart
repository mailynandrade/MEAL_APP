import 'package:meal_app/domain/entities/receta.dart';

//metodo para obtener las recetas de acuerdo al ingrediente seleccionado
abstract class DetalleRecetaDatasource { 
  Future<Receta> getDetalleReceta({required String id}); 
}