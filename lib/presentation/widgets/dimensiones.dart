//tamaños de las pantallas

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget ? tablet;
  final Widget ? desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop
  });

  static bool isMobile(BuildContext context) =>
  MediaQuery.sizeOf(context).width < 904;

  static bool isTablet(BuildContext context) =>
  MediaQuery.sizeOf(context).width < 1289 &&
  MediaQuery.sizeOf(context).width >= 904;

  static bool isDesktop(BuildContext context) =>
  MediaQuery.sizeOf(context).width >= 1280;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    if(size.width >= 1280 && desktop != null){
      return desktop!;
    }
    else if(size.width >= 904 && tablet != null ){
      return tablet!;
    }
    else{
      return mobile;
    }
    
  }
}