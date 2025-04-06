import 'package:dog1/ui/widgets/styles.dart';
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
      title: Center(
          child: Icon(Icons.check_circle,
              color: Color.fromARGB(255, 143, 151, 252), size: 100)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Success",
            style: Styles.headline,
          ),
          SizedBox(height: 10),
          Text(
            "Tu perfil ha sido completado exitosamente",
            textAlign: TextAlign.center,
            style: Styles.textMuted,
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: onConfirm,
            style: Styles.btn,
            child: Text("HECHO"),
          ),
        ),
      ],
    );
  }
}
