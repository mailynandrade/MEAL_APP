import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonNavigation extends StatefulWidget {
  final String categoria;

  const CustomButtonNavigation({super.key, required this.categoria});

  @override
  State<CustomButtonNavigation> createState() => _CustombuttonnavigationState();
}

class _CustombuttonnavigationState extends State<CustomButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Inicio',
        ),
        
      ]
    );
  }
}