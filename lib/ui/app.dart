import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/auth/introduction.dart';
import 'pages/auth/login.dart';
import 'pages/auth/create.dart';
import 'pages/auth/sign_up_in.dart';
import 'pages/auth/code_verify.dart';
import 'pages/auth/new_pass.dart';
import 'pages/auth/info_profile.dart';
import 'pages/auth/welcome.dart';
import 'pages/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black Dog',
      initialRoute: '/sign_up_in',
      routes: {
        //* Login
        '/login': (context) => const LoginPage(),
        '/introduction': (context) => const Introduction(),
        '/create': (context) => const CreateUser(),
        '/sign_up_in': (context) => const SignUpIn(),
        '/code_vefiry': (context) => const CodeVefiry(),
        '/new_pass': (context) => const NewPass(),
        '/info_profile': (context) => const InfoProfile(),
        '/welcome': (context) => const Welcome(),

        //* Home
        '/home': (context) => MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
