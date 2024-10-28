import 'package:go_router/go_router.dart';
import 'package:meal_app/presentation/screens/home_screen.dart';
import 'package:meal_app/presentation/screens/recetas_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()
    ),
     
    // Ruta para el listado con el parámetro `ingrediente`
    GoRoute(
  path: '/listado/:ingrediente', 
  builder: (context, state) {
    final ingrediente = state.pathParameters['ingrediente']!;
    return ListadoRecetasScreen(ingrediente: ingrediente); 
  },
),


    

]);