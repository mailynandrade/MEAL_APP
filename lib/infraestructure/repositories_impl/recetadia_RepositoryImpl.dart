import 'package:meal_app/domain/datasources/recetadia_datasource.dart';
import 'package:meal_app/domain/entities/receta.dart';

class RecetaDiaRepositoryImpl extends RecetaDiaDatasource{
  final RecetaDiaDatasource datasource;
  RecetaDiaRepositoryImpl(this.datasource);

  @override
  Future<Receta> getRecetaDia() async {
    return datasource.getRecetaDia();
  }
}