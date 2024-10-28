import 'package:meal_app/domain/datasources/recetaingrediente_datasource.dart';
import 'package:meal_app/domain/entities/receta.dart';

class RecetaIngredienteRepositoryImpl extends RecetaIngredienteDatasource{
  final RecetaIngredienteDatasource datasource;
  RecetaIngredienteRepositoryImpl(this.datasource);

  @override
  Future<List<Receta>> getRecetaPorIngrediente({required String ingrediente}) async {
    return datasource.getRecetaPorIngrediente(ingrediente: ingrediente);
  }
}