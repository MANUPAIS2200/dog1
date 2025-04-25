import 'package:flutter/material.dart';

class BottomNavBarHome extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarHome({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 190, 212, 255),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Image.asset(
              "assets/home/shop.png",
              width: 60,
              fit: BoxFit.contain,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home/notes.png",
              width: 65,
              fit: BoxFit.contain,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home/home.png",
              width: 50,
              fit: BoxFit.contain,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home/musica.png",
              width: 50,
              fit: BoxFit.contain,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home/meditacion.png",
              width: 60,
              fit: BoxFit.contain,
            ),
            label: 'Inicio',
          ),
        ],
      ),
    );
  }
}
