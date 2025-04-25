import 'package:flutter/material.dart';

class BtnPark extends StatelessWidget {
  const BtnPark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      bottom: 30,
      child: IconButton(
        icon: Image.asset(
          "assets/home/ARBOL.png",
          width: 65,
          fit: BoxFit.contain,
        ),
        onPressed: () {
          print("Botón presionado");
        },
      ),
    );
  }
}
