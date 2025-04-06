import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/home/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/home/piso_home.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 270,
            child: Image.asset(
              'assets/home/dog_home.png',
              fit: BoxFit.contain,
            ),
          ),

          //* Menu Minijuegos
          Positioned(
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
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
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
              )),
          Column(
            children: [
              AppBar(
                backgroundColor: const Color.fromARGB(0, 33, 149, 243),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('18500',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
