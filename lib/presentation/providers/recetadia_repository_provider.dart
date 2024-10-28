import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/infraestructure/datasources/recetadia_datasource.dart';
import 'package:meal_app/infraestructure/repositories_impl/recetadia_RepositoryImpl.dart';

final recetaDiaRepositoryProvider = Provider((ref){
  return RecetaDiaRepositoryImpl(RecetaDelDiaDatasource());
});