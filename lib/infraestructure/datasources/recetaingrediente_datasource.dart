import 'package:dio/dio.dart';
import 'package:meal_app/config/constant/environment.dart';
import 'package:meal_app/domain/datasources/recetaingrediente_datasource.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/infraestructure/mappers/receta_mapper.dart';
import 'package:meal_app/infraestructure/models/recetaResponse.dart';

class RecetaPorIngrediente extends RecetaIngredienteDatasource{
  final dio = Dio(
  BaseOptions(baseUrl: Environment.appUrl)
);

@override
  Future<List<Receta>> getRecetaPorIngrediente({required String ingrediente}) async {
  try {
       final response = await dio.get('filter.php', queryParameters: {'i': ingrediente});

      // Si la respuesta es exitosa, se procesa el JSON
      final objResponse = RecetaResponse.fromJson(response.data);

      final List<Receta> recetas = objResponse.meals.map((e) => RecetaMapper.recetaToEntity(e)).toList();
      return recetas;

    } on DioException catch (e) {
      // Manejo de errores de Dio
      String? errorMessage;

      if (e.response != null) {
        // El servidor respondió con un código de estado que indica un error
        errorMessage = 'Error ${e.response?.statusCode}: ${e.response?.data}';
      } else {
        // Error de conexión o de otro tipo
        errorMessage = e.message;
      }

      throw Exception(errorMessage);
    } catch (e) {
      // Manejo de cualquier otro tipo de error
      throw Exception('Un error inesperado ha ocurrido: $e');
    }  
  }
}