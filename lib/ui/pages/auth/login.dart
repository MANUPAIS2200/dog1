import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  Future<void> _loginWithEmail() async {
    final email = _emailController.text.trim();
    final pass = _passController.text.trim();

    // Validaciones
    if (email.isEmpty || pass.isEmpty) {
      _showError('Por favor completa todos los campos.');
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showError('El email no tiene un formato válido.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pushReplacementNamed(context, '/info_profile');
    } on FirebaseAuthException catch (e) {
      String message = 'Ocurrió un error al iniciar sesión.';
      if (e.code == 'user-not-found') {
        message = 'No existe una cuenta con ese email.';
      } else if (e.code == 'wrong-password') {
        message = 'La contraseña es incorrecta.';
      }
      _showError(message);
    } catch (e) {
      _showError('Error inesperado: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/fondo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    style: Styles.btnIconBack,
                    icon: const Icon(Icons.keyboard_arrow_left),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 35),
                Center(
                  child: Text(
                    'Bienvenid@ de nuevo!',
                    style: Styles.headline,
                  ),
                ),
                const SizedBox(height: 35),

                // Facebook (no implementado aún)
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
                const SizedBox(height: 25),

                // Google (no implementado aún)
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
                const SizedBox(height: 25),

                const Center(
                  child: Text(
                    'O INICIA CON TU EMAIL',
                    style: Styles.textMuted,
                  ),
                ),
                const SizedBox(height: 25),

                TextField(
                  controller: _emailController,
                  style: Styles.textField,
                  decoration: Styles.inputDecoration.copyWith(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: _passController,
                  obscureText: true,
                  style: Styles.textField,
                  decoration: Styles.inputDecoration.copyWith(
                    hintText: 'Contraseña',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: _loginWithEmail,
                    style: Styles.btn,
                    child: const Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/new_pass');
                    },
                    style: Styles.btnSecundary,
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TODAVÍA NO TIENES UNA CUENTA?",
                      style: Styles.textMuted,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create');
                      },
                      style: Styles.btnSecundary,
                      child: Text(
                        ' REGÍSTRATE',
                        style: Styles.textMuted.copyWith(
                          color: const Color.fromARGB(255, 143, 151, 252),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
