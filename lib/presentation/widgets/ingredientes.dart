import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/domain/entities/ingrediente.dart';
import 'package:meal_app/presentation/providers/ingredientes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/presentation/providers/recetaingrediente_provider.dart';

class TiposIngredientes extends ConsumerStatefulWidget {
  final List<Ingrediente> ingredientes;

  const TiposIngredientes({super.key, required this.ingredientes});

  @override
  TiposIngredientesState createState() =>
      TiposIngredientesState();
}



class TiposIngredientesState
    extends ConsumerState<TiposIngredientes> {
  final scrollController = ScrollController();

 @override
  void initState() {
    super.initState();
    ref.read(ingredientesProvider.notifier).loadListIngredientes();
    //ref.read(ingredientesProvider.notifier);

    scrollController.addListener(() {
      ref.read(ingredientesProvider);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


 @override
  Widget build(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return 
      Container(
      decoration: const BoxDecoration(
        color:Colors.white,
      ),
      height: height * 0.60,
      width: width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
         crossAxisCount: 3,
        ),
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(), 
          itemCount: widget.ingredientes.length,
          itemBuilder: (context, index){
            final ingrediente = widget.ingredientes[index];
            return IngredienteCard(ingrediente: ingrediente);}
        )
    );
  }
}

//formato de las tarjetas para mostrar el listado
class IngredienteCard extends StatelessWidget {
  final Ingrediente ingrediente;

  const IngredienteCard({super.key, required this.ingrediente});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       context.go('/listado/${ingrediente.strIngredient}');
      },
     child: Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),

          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(
              "https://www.themealdb.com/images/ingredients/${ingrediente.strIngredient}.png"
            ),
            height: 70,
          ),
          Text(
            ingrediente.strIngredient,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ingrediente.strType,
            style: const TextStyle(
              fontSize: 12
            ),
          )
        ],
        ),
        
        ),
    ))
    ;
  }
}

 









  
