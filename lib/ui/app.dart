import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black Dog',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
