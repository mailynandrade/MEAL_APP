import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/domain/entities/ingrediente.dart';
import 'package:meal_app/presentation/providers/ingredientes_repository_provider.dart';

final ingredientesProvider = StateNotifierProvider<IngredienteNotifier, List<Ingrediente>>((ref) {
  // se obtiene el repositorio
  final ingredienteRepository = ref.watch(ingredienteRepositoryProvider);
  return IngredienteNotifier(fetchIngredientes: ingredienteRepository.getIngredientes());
});

typedef IngredienteCallback = Future<List<Ingrediente>>;

class IngredienteNotifier extends StateNotifier<List<Ingrediente>> {
  IngredienteCallback fetchIngredientes;

  IngredienteNotifier({
    required this.fetchIngredientes,
  }) : super([]); 

  Future<void> loadListIngredientes() async {
    try {
      final List<Ingrediente> ingrediente = await fetchIngredientes;
      state = ingrediente.sublist(0,50); // solo 150 ingredientes
    } catch (e) {
      ('Error al cargar los ingredientes: $e');
    }
  }
}