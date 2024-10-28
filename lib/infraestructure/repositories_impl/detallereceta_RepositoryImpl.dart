import 'package:meal_app/domain/datasources/detallereceta_datasource.dart';
import 'package:meal_app/domain/entities/receta.dart';

class DetalleRecetaRepositoryImpl extends DetalleRecetaDatasource{
  final DetalleRecetaDatasource datasource;
  DetalleRecetaRepositoryImpl(this.datasource);

  @override
   Future<Receta> getDetalleReceta({required String id}) async {
    return datasource.getDetalleReceta(id: id);
   }
}