import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/infraestructure/datasources/detallereceta_datasource.dart';
import 'package:meal_app/infraestructure/repositories_impl/detallereceta_repositoryImpl.dart';

final detalleRecetaRepositoryProvider = Provider((ref){
  return DetalleRecetaRepositoryImpl(RecetaDetallesDatasource());
});