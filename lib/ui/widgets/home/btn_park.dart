import 'package:flutter/material.dart';

class BtnPark extends StatelessWidget {
  const BtnPark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 40,
      bottom: 40,
      child: IconButton(
        icon: Image.asset(
          "assets/home/ARBOL.png",
          width: 80,
          fit: BoxFit.contain,
        ),
        onPressed: () {
          print("Botón presionado");
        },
      ),
    );
  }
}
