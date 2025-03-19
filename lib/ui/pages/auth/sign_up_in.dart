import 'package:flutter/material.dart';
import '../../widgets/styles.dart';
import 'package:flutter/gestures.dart';

class SignUpIn extends StatelessWidget {
  const SignUpIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 35),
            Image.asset('assets/dog.png'),
            SizedBox(height: 20),
            Image.asset('assets/black_dog_logo.png'),
            Text(
              "Mascota virtual de apoyo emocional",
              style: Styles.headline,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 350,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/introduction');
                },
                style: Styles.btn,
                child: const Text(
                  'SIGUIENTE',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'TODAVÍA NO TIENES UNA CUENTA? ',
                style: Styles.textMuted, // Estilo del texto normal
                children: <TextSpan>[
                  TextSpan(
                    text: 'REGÍSTRATE',
                    style: TextStyle(
                      color: Color.fromARGB(255, 143, 151, 252),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context,
                            '/create'); // Navega a la página de registro
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
