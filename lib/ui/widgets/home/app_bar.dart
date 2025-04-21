import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          toolbarHeight: 80,
          title: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 90,
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.2, // 33% del ancho de la pantalla
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 152,
                                33), // Color de la barra de progreso
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('18500', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/monedas.png',
                    height: 26.0,
                  ),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerRight,
                    child: PopupMenuButton<String>(
                      icon: Icon(
                        Icons.menu_rounded,
                        size: 75,
                        color: Color.fromARGB(255, 45, 77, 109),
                      ),
                      offset: Offset(0, 70),
                      onSelected: (String value) {
                        print("Seleccionaste: $value");
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'opcion1',
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.settings,
                                size: 50,
                                color: Color.fromARGB(255, 45, 77, 109),
                              ),
                              onPressed: () {
                                print("Botón presionado");
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        )
      ],
    );
  }
}
