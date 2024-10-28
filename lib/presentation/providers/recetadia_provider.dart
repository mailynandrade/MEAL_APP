import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/presentation/providers/recetadia_repository_provider.dart';

final recetaDiaProvider = FutureProvider<Receta>((ref) async {
  // Se obtiene el repositorio
  final recetaRepository = ref.watch(recetaDiaRepositoryProvider);
  return await recetaRepository.getRecetaDia();
});


