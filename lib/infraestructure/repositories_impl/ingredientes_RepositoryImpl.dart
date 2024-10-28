import 'package:meal_app/domain/datasources/ingredientes_datasource.dart';
import 'package:meal_app/domain/entities/ingrediente.dart';

class IngredientesRepositoryImpl extends IngredientesDatasource {
  final IngredientesDatasource datasource;
  IngredientesRepositoryImpl(this.datasource);

  @override
   Future<List<Ingrediente>> getIngredientes() async {
   return datasource.getIngredientes();
   }
}