import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/domain/entities/receta.dart';
import 'package:meal_app/presentation/providers/recetaingrediente_provider.dart';
//import 'package:meal_app/presentation/shared/custom_bottom_navigation.dart';

class ListadoRecetasScreen extends ConsumerStatefulWidget {
  final String ingrediente;

  const ListadoRecetasScreen({super.key, required this.ingrediente});

  @override
  ListadoRecetasScreenState createState() => ListadoRecetasScreenState();
}

class ListadoRecetasScreenState
    extends ConsumerState<ListadoRecetasScreen> {
  final scrollController = ScrollController();

 @override
  void initState() {
    super.initState();
    ref.read(recetaIngredienteProvider.notifier).loadReceta(widget.ingrediente);
    //ref.read(ingredientesProvider.notifier);

    scrollController.addListener(() {
      ref.read(recetaIngredienteProvider);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


 @override
  Widget build(BuildContext context) {
    final recetas = ref.watch(recetaIngredienteProvider);
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            context.go('/'); 
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Detalles'),
            IconButton(
              onPressed: null, // Aquí puedes agregar la acción deseada
              icon: const Icon(Icons.local_restaurant_sharp),
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: recetas.length,
            itemBuilder: (context, index) {
              final receta = recetas[index];
              return RecetaCard(
                receta: receta,
                );
            }),)
        ],
      ),
    );
  }
}

//formato de las tarjetas para mostrar el listado
class RecetaCard extends StatelessWidget {
  final Receta receta;

  const RecetaCard({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),


      ),
      margin: const EdgeInsets.symmetric(horizontal:25, vertical:10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    receta.strMealThumb,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(),
                Column(
                  children: [
                   Padding( 
                          padding: const EdgeInsets.only(left: 8.0), 
                          child: Text(
                            receta.strMeal,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4), 
                        Padding( 
                          padding: const EdgeInsets.only(left: 8.0), 
                          child: Text(
                            receta.strArea,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding( 
                          padding: const EdgeInsets.only(left: 8.0), 
                          child: Text(
                            receta.strYoutube,
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                  ],
                ),
                const Spacer()
              ],
            ),
          ),

        ],
      ),
    );
    
  }
}

      
      
      
      
      
      
      
      
      
      
      
      

