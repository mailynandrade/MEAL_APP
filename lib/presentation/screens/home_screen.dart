import 'package:flutter/material.dart';
import 'package:meal_app/presentation/providers/ingredientes_provider.dart';
import 'package:meal_app/presentation/providers/recetadia_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/presentation/widgets/ingredientes.dart';
import 'package:meal_app/presentation/widgets/receta_del_dia.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false, 
      centerTitle: true, 
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('THE MEAL API'),
          IconButton(onPressed: null, icon: const Icon(Icons.local_restaurant_sharp), 
          color: Theme.of(context).iconTheme.color)
        ],
      )),

       body: const _HomeBody(),
    );
  }
}

class _HomeBody extends ConsumerStatefulWidget {
  const _HomeBody();

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends ConsumerState<_HomeBody> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

  final ingredientes = ref.watch(ingredientesProvider);

 return SingleChildScrollView( 
    child: Column(
      children: [
        const BuildRecetaDia(),
        const SizedBox(height: 20),
        TiposIngredientes(ingredientes: ingredientes),
      ],
    ),
  );
    }

   


}




