import 'package:flutter/material.dart';
import '../../widgets/styles.dart';
import 'package:flutter/services.dart';

class CodeVefiry extends StatelessWidget {
  const CodeVefiry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    style: Styles.btnIconBack,
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 35),
                Center(
                  child: Text(
                    'Código de verificación',
                    style: Styles.headline,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Center(
                            child: Text(
                              "Por favor introduce el código que te enviamos a tu email",
                              style: Styles.textMuted,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              child: TextField(
                                maxLength: 1,
                                keyboardType: TextInputType
                                    .number, // Muestra teclado numérico
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Solo permite números
                                ],
                                style: Styles.textField,
                                textAlign: TextAlign.center,
                                decoration: Styles.inputDecoration.copyWith(
                                    counterText: "",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                onChanged: (text) {},
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              width: 70,
                              child: TextField(
                                maxLength: 1,
                                keyboardType: TextInputType
                                    .number, // Muestra teclado numérico
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Solo permite números
                                ],
                                style: Styles.textField,
                                textAlign: TextAlign.center,
                                decoration: Styles.inputDecoration.copyWith(
                                    counterText: "",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                onChanged: (text) {},
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              width: 70,
                              child: TextField(
                                maxLength: 1,
                                keyboardType: TextInputType
                                    .number, // Muestra teclado numérico
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Solo permite números
                                ],
                                style: Styles.textField,
                                textAlign: TextAlign.center,
                                decoration: Styles.inputDecoration.copyWith(
                                    counterText: "",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                onChanged: (text) {},
                              ),
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              width: 70,
                              child: TextField(
                                maxLength: 1,
                                keyboardType: TextInputType
                                    .number, // Muestra teclado numérico
                                inputFormatters: [
                                  FilteringTextInputFormatter
                                      .digitsOnly, // Solo permite números
                                ],
                                style: Styles.textField,
                                textAlign: TextAlign.center,
                                decoration: Styles.inputDecoration.copyWith(
                                    counterText: "",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                onChanged: (text) {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: 300,
                          child: Center(
                            child: Text(
                              "¿No recibiste tu código?",
                              style: Styles.textMuted,
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/code_verify');
                            },
                            child: const Text(
                              'Reenviar',
                              style: Styles.textAttention,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/code_vefiry');
                            },
                            style: Styles.btn,
                            child: const Text(
                              'VERIFICAR',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
          // Positioned(
          //   top: 30,
          //   left: 16,
          //   child: IconButton(
          //     style: Styles.btnIconBack,
          //     icon: Icon(Icons.keyboard_arrow_left),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
