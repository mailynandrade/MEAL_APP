import 'package:meal_app/domain/entities/receta.dart';

//metodo para obtener la receta random, que va a ser la del día
abstract class RecetaDiaRepository { 
  Future<Receta> getRecetaDia(); 
}