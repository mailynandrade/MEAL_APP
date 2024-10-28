import 'package:dio/dio.dart';
import 'package:meal_app/config/constant/environment.dart';
import 'package:meal_app/domain/datasources/ingredientes_datasource.dart';
import 'package:meal_app/domain/entities/ingrediente.dart';
import 'package:meal_app/infraestructure/mappers/ingrediente_mapper.dart';
import 'package:meal_app/infraestructure/models/ingredienteResponse.dart';

class TodosIngredientesDatasource extends IngredientesDatasource{
  final dio = Dio(
  BaseOptions(baseUrl: Environment.appUrl)
);

@override
 Future<List<Ingrediente>> getIngredientes() async {
try {
      final response = await dio.get('list.php?i=list');

      // Si la respuesta es exitosa, se procesa el JSON
      final objResponse = IngredienteResponse.fromJson(response.data);

      final List<Ingrediente> ingredientes = objResponse.meals.map((e) => IngredienteMapper.ingredienteToEntity(e)).toList();
      return ingredientes;

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
