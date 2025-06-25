import 'package:flutter/material.dart';
import '../../../widgets/styles.dart';
import '../memotest/game_memotest.dart';

class MinigamesMemotest extends StatefulWidget {
  @override
  MinigamesMemotestState createState() => MinigamesMemotestState();
}

class MinigamesMemotestState extends State<MinigamesMemotest> {
  final List<Map<String, dynamic>> botones = [
    {
      'texto': 'Fácil (4x4)',
      'color': Colors.lightBlueAccent,
      'alineacion': Alignment.centerLeft,
      'datos': {
        'level': 'easy',
        'grid': '4',
        'id_game': 1
      } //id_game 1 = memotest
    },
    {
      'texto': 'Medio (6x6)',
      'color': Colors.greenAccent,
      'alineacion': Alignment.centerRight,
      'datos': {'level': 'medium', 'grid': '6', 'id_game': 1}
    },
    {
      'texto': 'Difícil (8x8)',
      'color': Colors.deepPurpleAccent,
      'alineacion': Alignment.centerLeft,
      'datos': {'level': 'hard', 'grid': '8', 'id_game': 1}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //* Titulo
          Positioned(
            top: -50,
            left: -50,
            right: -50,
            child: Transform.rotate(
              angle: 10 * 3.1415926535 / 180, // 20 grados en radianes
              child: Container(
                height: 200,
                color: Color.fromARGB(255, 143, 151, 252),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "MEMOTEST",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          //* Fondo
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/home/piso_home.png',
              fit: BoxFit.contain,
            ),
          ),
          //* Boton juguemos
          Positioned(
            left: 0,
            right: 0,
            bottom: 65,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              style: Styles.btn,
              child: Text(
                ' JUGUEMOS',
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: botones.map((boton) {
                  return Column(
                    children: [
                      Align(
                        alignment: boton['alineacion'],
                        child: SizedBox(
                          width: 280,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/minigames/memotest/game',
                                arguments:
                                    boton['datos'], // Enviar los datos aquí
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: boton['color'],
                              padding: EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              boton['texto'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
