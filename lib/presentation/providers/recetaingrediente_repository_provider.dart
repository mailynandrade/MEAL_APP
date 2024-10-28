import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/infraestructure/datasources/recetaingrediente_datasource.dart';
import 'package:meal_app/infraestructure/repositories_impl/recetaingrediente_RepositoryImpl.dart';

final recetaIngredienteRepositoryProvider = Provider((ref){
  return RecetaIngredienteRepositoryImpl(RecetaPorIngrediente());
});