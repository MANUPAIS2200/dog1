import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/models/usuario.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String?> registerUser({
    required String nombre,
    required String email,
    required String password,
    int? edad,
    String? sexo,
  }) async {
    try {
      print(
          '>>> [registerUser] Intentando registrar usuario con email: $email');

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        print('>>> [registerUser] Error: el userCredential.user es null');
        return 'No se pudo registrar el usuario';
      }

      print('>>> [registerUser] Usuario registrado con UID: ${user.uid}');

      final usuario = Usuario(
        uid: user.uid,
        nombre: nombre,
        email: email,
        edad: edad,
        sexo: sexo,
        nivel: 1,
        puntos: 0,
      );

      print('>>> [registerUser] Usuario creado: ${usuario.toMap()}');

      await _db.collection('usuarios').doc(user.uid).set(usuario.toMap());
      print('>>> [registerUser] Usuario guardado en Firestore');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('nombre', nombre);
      await prefs.setString('email', email);
      await prefs.setString('uid', user.uid);
      print('>>> [registerUser] Datos guardados en SharedPreferences');

      return null;
    } on FirebaseAuthException catch (e) {
      print(
          '>>> [registerUser] FirebaseAuthException: ${e.code} - ${e.message}');
      return 'FirebaseAuthException: ${e.message}';
    } catch (e) {
      print('>>> [registerUser] Error inesperado: $e');
      return 'Error inesperado: $e';
    }
  }

  Future<String?> signInWithGoogle(BuildContext context) async {
    try {
      print('>>> Iniciando sesión con Google');

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print('>>> El usuario canceló el login con Google');
        return 'Inicio cancelado por el usuario';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      if (user != null) {
        final docRef = _db.collection('usuarios').doc(user.uid);
        final docSnapshot = await docRef.get();

        if (!docSnapshot.exists) {
          await docRef.set({
            'uid': user.uid,
            'nombre': user.displayName ?? '',
            'email': user.email ?? '',
            'nivel': 1,
            'puntos': 0,
            'edad': null,
            'sexo': null,
          });

          print('>>> Usuario nuevo guardado en Firestore');
        } else {
          print('>>> Usuario ya existe en Firestore');
        }

        // Guardar datos localmente
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('nombre', user.displayName ?? '');
        await prefs.setString('email', user.email ?? '');
        await prefs.setString('uid', user.uid);

        print('>>> Login exitoso. Redirigiendo a /home');

        // Redirigir al home
        Navigator.pushReplacementNamed(context, '/home');
        return null;
      } else {
        print('>>> Error: userCredential.user es null');
        return 'Error al iniciar sesión con Google';
      }
    } catch (e) {
      print('Error en Google Sign-In: $e');
      return 'Error al iniciar sesión con Google';
    }
  }
}
