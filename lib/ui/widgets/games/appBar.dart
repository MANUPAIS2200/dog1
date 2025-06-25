import 'package:flutter/material.dart';

class AppBarGames extends StatelessWidget implements PreferredSizeWidget {
  final int id_game;
  final String id_player;

  const AppBarGames(
      {super.key, required this.id_game, required this.id_player});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Memotest",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline, color: Colors.black),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("¿Cómo se juega?"),
                  content: const Text(
                      "Tenés que encontrar los pares de cartas iguales. Al hacer clic en dos cartas, si coinciden, quedan visibles. ¡Buena suerte!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra el modal
                      },
                      child: const Text("Entendido"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
