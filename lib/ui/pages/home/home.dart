import 'package:dog1/ui/widgets/home/app_bar.dart';
import 'package:dog1/ui/widgets/home/bottom_nav_bar.dart';
import 'package:dog1/ui/widgets/home/btn_park.dart';
import 'package:dog1/ui/widgets/home/popup_minigames.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
//import 'package:babylonjs_viewer/babylonjs_viewer.dart';

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

            //* App bar top
            AppBarHome(),

            //* Contenido
            Center(
              child: ModelViewer(
                src: 'assets/models/dog.glb',
                alt: "Un modelo 3D",
                ar: true,
                autoRotate: false,
                cameraControls: true,
              ),
            ),

            //* Boton para el parque
            BtnPark(),

            //* Menu Minijuegos
            PopupMinigames(),
          ],
        ),
        bottomNavigationBar: BottomNavBarHome(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
