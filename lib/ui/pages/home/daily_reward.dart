import 'package:flutter/material.dart';
import 'package:dog1/services/firebase_service.dart';

class DailyReward extends StatefulWidget {
  @override
  DailyRewardState createState() => DailyRewardState();
}

class DailyRewardState extends State<DailyReward> {
  Offset? _tapPosition;
  bool _showGif = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition;
      _showGif = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showGif = false;
      });

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("¡Has encontrado una recompensa!"),
          content: Text("Recoge tu premio diario."),
          actions: [
            TextButton(
              onPressed: () async {
                final firebaseService = FirebaseService();
                await firebaseService.setDailyRewardClaimed();

                Navigator.pushNamed(context, '/home');
              },
              child: Text("Aceptar"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: _onTapDown,
        child: Stack(
          children: [
            Image.asset(
              'assets/garden.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            if (_showGif && _tapPosition != null)
              Positioned(
                left: _tapPosition!.dx - 50,
                top: _tapPosition!.dy - 50,
                child: Image.asset(
                  'assets/dog_digging.gif',
                  width: 100,
                  height: 100,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
