import 'package:flutter/material.dart';
import '../widgets/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 120, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Center(
                  child: Text(
                    'Bienvenid@ de nuevo!',
                    style: Styles.headline,
                  ),
                ),
                SizedBox(height: 35),

                // Botón de Facebook
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

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/'); 
                  },
                  child: const Text(
                    'O INICIA CON TU EMAIL',
                    style: Styles.textMuted,
                  ),
                ),
                SizedBox(height: 25),

                // Campo de Email
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    style: Styles.textField,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors.grey),
                    ),
                    onChanged: (text) {
                      print("Email");
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Campo de Contraseña
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    style: Styles.textField,
                    decoration: Styles.inputDecoration.copyWith(
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(
                          color: Colors.grey), 
                    ),
                    onChanged: (text) {
                      print("Contraseña");
                    },
                  ),
                ),
                SizedBox(height: 35),

                // Botón de Ingresar
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/'); // Navega a Home
                    },
                    style: Styles.btn,
                    child: const Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Botón de Olvidaste tu contraseña
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/'); // Navega a Home
                    },
                    style: Styles.btnSecundary,
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                // Botón para registrarse
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TODAVIA NO TIENES UNA CUENTA?",
                      style: Styles.textMuted,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/'); // Navega a Home
                        },
                        style: Styles.btnSecundary,
                        child: Text(
                          ' REGISTRATE',
                          style: Styles.textMuted.copyWith(
                              color: Color.fromARGB(255, 143, 151, 252),
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ),

          // Botón de retroceso en la parte superior
          Positioned(
            top: 30,
            left: 16,
            child: IconButton(
              style: Styles.btnIcon,
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context); // Regresa a la página anterior
              },
            ),
          ),
        ],
      ),
    );
  }
}
