import 'package:flutter/material.dart';
import 'package:dog1/ui/widgets/styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 143, 151, 252),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/cielo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 360,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  child: Image.asset(
                    'assets/dog.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16, left: 16),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: Styles.btnWhite,
                        child: const Text(
                          'EMPECEMOS',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Center(
                        child: Text(
                          'BLACK DOG',
                          style: Styles.headline,
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: 400,
                        child: Center(
                          child: Text(
                            "Hola Manuel ¡Bienvenido!",
                            style: Styles.headline.merge(Styles.textWhite),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Center(
                        child: Text(
                          "Explore the app, Find some peace of mind to prepare for meditation.",
                          style: Styles.textMuted.merge(Styles.textWhite),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
