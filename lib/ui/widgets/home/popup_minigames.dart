import 'package:flutter/material.dart';

class PopupMinigames extends StatelessWidget {
  const PopupMinigames({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 40,
        bottom: 40,
        child: Theme(
          data: Theme.of(context).copyWith(
            popupMenuTheme: PopupMenuThemeData(
              color: const Color.fromARGB(255, 223, 223, 223),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: PopupMenuButton<String>(
            offset: Offset(0, -150),
            icon: Image.asset(
              "assets/home/minijuegos.png",
              width: 100,
              fit: BoxFit.contain,
            ),
            onSelected: (String value) {
              print("Seleccionaste: $value");
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'opcion1',
                child: Center(
                  child: IconButton(
                    icon: Image.asset(
                      "assets/home/baño.png",
                      width: 65,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      print("Botón presionado");
                    },
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'opcion1',
                child: Center(
                  child: IconButton(
                    icon: Image.asset(
                      "assets/home/juegos.png",
                      width: 65,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      print("Botón presionado");
                    },
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'opcion1',
                child: Center(
                  child: IconButton(
                    icon: Image.asset(
                      "assets/home/comida.png",
                      width: 65,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      print("Botón presionado");
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
