import 'package:flutter/material.dart';

class Styles {
  static const TextStyle headline = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle text = TextStyle(fontSize: 18, color: Colors.black);

  static const TextStyle textMuted =
      TextStyle(fontSize: 18, color: Color.fromARGB(127, 0, 0, 0));

  static const TextStyle textAttention =
      TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 79, 79));

  static const TextStyle textWhite =
      TextStyle(color: Color.fromARGB(255, 255, 255, 255));

  static final ButtonStyle btn = TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 143, 151, 252),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    padding: const EdgeInsets.symmetric(
        vertical: 25.0), // Padding en el eje Y (vertical)
  );

  static final ButtonStyle btnSecundary = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    foregroundColor: Colors.black87,
    padding: const EdgeInsets.symmetric(
        vertical: 25.0), // Padding en el eje Y (vertical)
  );

  static final ButtonStyle btnWhite = TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    foregroundColor: Colors.black87,
    padding: const EdgeInsets.symmetric(
        vertical: 25.0), // Padding en el eje Y (vertical)
  );

  static final ButtonStyle btnIconBack = IconButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: BorderSide(
        color: const Color.fromARGB(127, 136, 136, 136),
        width: 1,
      ),
    ),
    foregroundColor: Colors.black87,
    iconSize: 50.0,
  );

  static const TextStyle textField =
      TextStyle(fontSize: 16, color: Colors.black, height: 2);

  static const TextStyle labelStyle = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 158, 158, 158),
  );

  static InputDecoration inputDecoration = InputDecoration(
    labelStyle: labelStyle, // Estilo para la etiqueta
    filled: true,
    fillColor: const Color.fromARGB(255, 242, 243, 247),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide.none,
    ),
  );
}
