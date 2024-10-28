import 'package:dio/dio.dart';
import 'package:meal_app/config/constant/environment.dart';
import 'package:meal_app/domain/datasources/detallereceta_datasource.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/infraestructure/mappers/receta_mapper.dart';
import 'package:meal_app/infraestructure/models/recetaResponse.dart';

class RecetaDetallesDatasource extends DetalleRecetaDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.appUrl));

  @override
  Future<Receta> getDetalleReceta({required String id}) async {
    try {
      final response = await dio.get('lookup.php', queryParameters: {'i': id});

      // Si la respuesta es exitosa, se procesa el JSON
      final objResponse = RecetaResponse.fromJson(response.data);

      if (objResponse.meals.isNotEmpty) {
        //se obtiene el único elemento del array
        final Receta receta = RecetaMapper.recetaToEntity(objResponse.meals[0]);
        return receta;
      } else {
        throw Exception('No se encontró la receta para el id: $id');
      }
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
