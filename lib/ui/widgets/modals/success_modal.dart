import 'package:flutter/material.dart';

class SuccessModal extends StatelessWidget {
  final VoidCallback onConfirm;

  const SuccessModal({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(child: Text("¡Perfil completado! 🎉")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 50),
          SizedBox(height: 10),
          Text(
            "Tu perfil ha sido completado exitosamente.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onConfirm,
          child: Text("Aceptar"),
        ),
      ],
    );
  }
}
