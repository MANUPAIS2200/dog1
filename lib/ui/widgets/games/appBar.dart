import 'package:flutter/material.dart';

class AppBarGames extends StatelessWidget implements PreferredSizeWidget {
  final int id_game;
  final String id_player;
  final int totalPoints;
  const AppBarGames(
      {super.key,
      required this.id_game,
      required this.id_player,
      required this.totalPoints});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (totalPoints == 0) {
          return true; // ✅ Permite salir sin mostrar el diálogo
        }

        // ❌ Advertencia si el puntaje no es cero
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("¿Salir del juego?"),
              content: Text(
                  "Tenés $totalPoints puntos. Si salís ahora, vas a perder tu progreso. ¿Querés continuar?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra solo el diálogo
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                    Navigator.of(context)
                        .pop(); // Vuelve a la pantalla anterior
                  },
                  child: const Text("Salir"),
                ),
              ],
            );
          },
        );

        return false; // ❗ Evita salir automáticamente
      },
      child: Scaffold(
        appBar: AppBar(
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
                      content: Text(
                          "Tenés que encontrar los pares de cartas iguales. Al hacer clic en dos cartas, si coinciden, quedan visibles. ¡Buena suerte! Puntaje actual: $totalPoints"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
