import 'package:flutter/material.dart';
import '../../widgets/styles.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: double.infinity, // Toma todo el ancho disponible
              child: Image.asset(
                'assets/fondo.png',
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16),
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
                      'Nueva contraseña',
                      style: Styles.headline,
                    ),
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                    width: 400,
                    child: Center(
                      child: Text(
                        "Tu nueva contraseña debe ser diferente a la introducida anteriormente.",
                        style: Styles.textMuted,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  //* Input new Password
                  Container(
                    width:
                        double.infinity, // Hace que ocupe todo el ancho posible
                    alignment: Alignment.centerLeft, // Alinea a la derecha
                    child: Text("Contraseña"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      obscureText:
                          _obscureText1, // Controla si se oculta o muestra el texto
                      style: Styles.textField,
                      decoration: Styles.inputDecoration.copyWith(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText1
                                ? Icons.visibility_off
                                : Icons.visibility, // Cambia el ícono
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText1 =
                                  !_obscureText1; // Alternar entre ocultar y mostrar
                            });
                          },
                        ),
                      ),
                      onChanged: (text) {
                        print("Password: $text");
                      },
                    ),
                  ),
                  SizedBox(height: 25),

                  //* Input confirm Password
                  Container(
                    width:
                        double.infinity, // Hace que ocupe todo el ancho posible
                    alignment: Alignment.centerLeft, // Alinea a la derecha
                    child: Text("Confirmar contraseña"),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      obscureText:
                          _obscureText2, // Controla si se oculta o muestra el texto
                      style: Styles.textField,
                      decoration: Styles.inputDecoration.copyWith(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText2
                                ? Icons.visibility_off
                                : Icons.visibility, // Cambia el ícono
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText2 =
                                  !_obscureText2; // Alternar entre ocultar y mostrar
                            });
                          },
                        ),
                      ),
                      onChanged: (text) {
                        print("Password: $text");
                      },
                    ),
                  ),
                  SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/code_vefiry');
                      },
                      style: Styles.btn,
                      child: const Text(
                        'CREAR NUEVA CONTRASEÑA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
