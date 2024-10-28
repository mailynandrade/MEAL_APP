import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/infraestructure/datasources/ingredientes_datasource.dart';
import 'package:meal_app/infraestructure/repositories_impl/ingredientes_RepositoryImpl.dart';

final ingredienteRepositoryProvider = Provider((ref){
  return IngredientesRepositoryImpl(TodosIngredientesDatasource());
});