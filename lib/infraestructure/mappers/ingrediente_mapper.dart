import 'package:meal_app/domain/entities/ingrediente.dart';
import 'package:meal_app/infraestructure/models/ingredienteData.dart';

class IngredienteMapper {
static Ingrediente ingredienteToEntity(IngredienteData data) => Ingrediente(
  idIngredient: data.idIngredient,
  strIngredient: data.strIngredient,
  strType: data.strType
);
}

