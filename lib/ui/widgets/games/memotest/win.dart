import 'package:flutter/material.dart';

Future<void> modalWin(
    BuildContext context, int totalPoints, int totalPointsPlayer) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text("¡Ganaste!"),
        content: Text(
          "El juego se reiniciará.\nTu puntaje fue $totalPoints.\nPuntos en total: $totalPointsPlayer",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cerrar"),
          ),
        ],
      );
    },
  );
}
