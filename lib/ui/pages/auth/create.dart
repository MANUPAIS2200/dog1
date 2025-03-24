import 'package:flutter/material.dart';
import '../../widgets/styles.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  bool isChecked = false;
  bool _obscureText = true;
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
          SingleChildScrollView(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Crea una cuenta',
                    style: Styles.headline,
                  ),
                ),
                SizedBox(height: 35),

                //* Botón de Facebook
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: Styles.btn,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Image.asset(
                              'assets/facebook.png',
                              height: 26.0,
                            ),
                          ),
                        ),
                        const Text(
                          'CONTINUAR CON FACEBOOK',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),

                //* Botón de Facebook
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: Styles.btnSecundary,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Image.asset(
                              'assets/google.png',
                              height: 26.0,
                            ),
                          ),
                        ),
                        const Text(
                          'CONTINUAR CON GOOGLE',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),

                Center(
                  child: const Text(
                    'O REGISTRATE CON TU EMAIL',
                    style: Styles.textMuted,
                  ),
                ),
                SizedBox(height: 25),

                //* Input Nombre
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    style: Styles.textField,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Nombre',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (text) {
                      print("Nombre");
                    },
                  ),
                ),
                SizedBox(height: 20),

                //* Input Email
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    style: Styles.textField,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                    onChanged: (text) {
                      print("Email");
                    },
                  ),
                ),
                SizedBox(height: 20),

                //* Input Password
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    obscureText:
                        _obscureText, // Controla si se oculta o muestra el texto
                    style: Styles.textField,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility, // Cambia el ícono
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Alternar entre ocultar y mostrar
                          });
                        },
                      ),
                    ),
                    onChanged: (text) {
                      print("Password: $text");
                    },
                  ),
                ),
                SizedBox(height: 20),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "He leído y acepto los términos y condiciones de uso",
                          style: Styles.textAttention,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                      )
                    ],
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
                      'EMPECEMOS',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
