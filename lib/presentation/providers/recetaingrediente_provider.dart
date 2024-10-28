import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/presentation/providers/recetaingrediente_repository_provider.dart';



final recetaIngredienteProvider = StateNotifierProvider<RecetaNotifier, List<Receta>>((ref) {
  // se obtiene el repositorio
  final recetaRepository = ref.watch(recetaIngredienteRepositoryProvider);
  return RecetaNotifier(fetchRecetaIngrediente: recetaRepository.getRecetaPorIngrediente);
});

typedef RecetaCallback = Future<List<Receta>> Function({required String ingrediente});

class RecetaNotifier extends StateNotifier<List<Receta>> {
  RecetaCallback fetchRecetaIngrediente;

  RecetaNotifier({
    required this.fetchRecetaIngrediente,
  }) : super([]); 

  Future<void> loadReceta(String ingrediente) async {
    try {
      final List<Receta> receta = await fetchRecetaIngrediente(ingrediente: ingrediente);
      state = receta; 
    } catch (e) {
      ('Error al cargar las recetas: $e');
    }
  }
}

