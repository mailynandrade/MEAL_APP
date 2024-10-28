import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/presentation/providers/detallereceta_Repository_provider.dart';


final detalleRecetaProvider = StateNotifierProvider<RecetaNotifier, Receta>((ref) {
  // Obtiene el repositorio
  final recetaRepository = ref.watch(detalleRecetaRepositoryProvider);
 
  return RecetaNotifier(
    fetchRecetaDetalles: recetaRepository.getDetalleReceta,
    recetaInicial: Receta(idMeal: '', strMeal: '', strInstructions: '', strArea: '', strCategory: '', strMealThumb: '', strTags: '', strYoutube: '', ingredients: List.empty()),
  );
});

typedef RecetaCallback = Future<Receta> Function({required String id});

class RecetaNotifier extends StateNotifier<Receta> {
  final RecetaCallback fetchRecetaDetalles;

  RecetaNotifier({
    required this.fetchRecetaDetalles,
    required Receta recetaInicial,
  }) : super(recetaInicial); 

  Future<void> loadReceta(String id) async {
    try {
      final Receta receta = await fetchRecetaDetalles(id: id);
      state = receta; 
    } catch (e) {

      print('Error al cargar la receta: $e');
    }
  }
}



