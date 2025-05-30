import 'package:flutter/material.dart';

class Minigames extends StatelessWidget {
  final List<Map<String, dynamic>> minijuegos = [
    {
      'titulo': 'Puzzle',
      'imagen': 'assets/minigames/menu/ej1.png',
      'color': Color.fromARGB(255, 143, 151, 252)
    },
    {
      'titulo': 'Memoria',
      'imagen': 'assets/minigames/menu/ej2.png',
      'color': Color.fromARGB(255, 177, 95, 209)
    },
    {
      'titulo': 'Sopa de letras',
      'imagen': 'assets/minigames/menu/ej3.png',
      'color': Color.fromARGB(255, 199, 243, 140)
    },
    {
      'titulo': 'Rompecabezas',
      'imagen': 'assets/minigames/menu/ej4.png',
      'color': Color.fromARGB(255, 252, 189, 138)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minijuegos'),
        backgroundColor: Color.fromARGB(255, 143, 151, 252),
      ),
      body: Container(
        color: Color.fromARGB(255, 234, 235, 254),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.count(
            crossAxisCount: 2, // 2 columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // ajusta la altura vs ancho
            children: minijuegos.map((juego) {
              return GestureDetector(
                onTap: () {
                  // Aquí puedes navegar al minijuego correspondiente
                  print('Seleccionado: ${juego['titulo']}');
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: juego['color'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          juego['titulo']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(juego['imagen']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
