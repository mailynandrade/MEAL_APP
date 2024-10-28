import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/presentation/providers/recetadia_provider.dart';

class BuildRecetaDia extends ConsumerWidget {
  const BuildRecetaDia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener la receta del día
    AsyncValue<Receta> receta = ref.watch(recetaDiaProvider);

    
   return receta.when(
      error: (err, stack) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(child: Text(err.toString())),
      ),
      loading: () => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      data: (recetadelDia) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(recetadelDia.strMealThumb),
              child: InkWell(
                onTap: () {}, 
              ),
              height: 240,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
            ),
            Text(
              'Receta del Día',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}










/*import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/presentation/providers/recetadia_provider.dart';


class BuildRecetaDia extends ConsumerWidget {
  const BuildRecetaDia({super.key});

  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object>,T) watch ) {
    //final recetadelDia = ref.watch(recetaDiaProvider); // Obtener la receta aquí
   AsyncValue<Receta> receta = watch(recetaDiaProvider);
    return Card( 
      receta.when(error: (err,Stack) =>Center(child: Text(err.toString()),), loading: ()=>Center(child: CircularProgressIndicator(),)),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: 
             NetworkImage(
            recetadelDia.strMealThumb,
            ),
            child: InkWell(
              onTap: () {},
            ),
            height: 240,
            fit: BoxFit.cover,
          ),
           Text(
            recetadelDia.strMeal + recetadelDia.idMeal,
            
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }
}*/
