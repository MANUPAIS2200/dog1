import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dog1/ui/widgets/games/appBar.dart';
import 'package:dog1/ui/widgets/games/memotest/score_overlay.dart';
import 'package:dog1/ui/widgets/games/memotest/win.dart';
import 'package:dog1/ui/widgets/games/memotest/animations/card_turn.dart';
import 'package:dog1/services/games/firebase_service.dart';

class GameMemotest extends StatefulWidget {
  final Map<String, dynamic> datos;
  const GameMemotest({super.key, required this.datos});

  @override
  State<GameMemotest> createState() => _GameMemotestState();
}

class _GameMemotestState extends State<GameMemotest> {
  //* Variables:
  // grid -> se usa para generar los cuadros del juego
  // valores -> es una lista con el valor de cada carta, cada valor esta repetido para su carta pareja
  // revelados -> representa al estado de la carta FALSE=volteada TRUE=revelada
  // enJuego -> contiene un array con la informacion de la 1° y 2° carta [Valor,Pocision,Valor,Pocision]
  // bloqueado se usa para evitar bug al abrir cartas rapidamente
  late int grid;
  late List<int> valores;
  List<bool> revelados = [];
  List<int> enJuego = [];
  bool bloqueado = false;

  //* Variables para sistema de puntos:
  // point -> valor de punto base
  // combo -> Funciona como multiplicador en rachas (opcional)
  // pointsMade -> puntos generados en ultima jugada
  // totalPoints -> total de puntos en juego
  // lastPointsMade -> para mostrar el overlay temporal
  // playerData -> Informnacion del usuario como Player
  int point = 1;
  int combo = 1;
  int pointsMade = 0;
  int totalPoints = 0;
  int? lastPointsMade;
  Map<String, dynamic>? playerData;

  void loadPlayerData() async {
    FirebaseService firebaseService = FirebaseService();
    var data = await firebaseService.getPlayerByUserAndGame(
      "3D6JKLnpt2WcTDrU11cU3TllMrp1",
      "1",
    );
    setState(() {
      playerData = data;
      print("Datos del jugador: $playerData");
      print(playerData!["points"]);
    });
  }

  void resetGame() async {
    for (int i = 0; i < revelados.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100)); // 1 segundo
      setState(() {
        revelados[i] = false;
      });
      await Future.delayed(const Duration(milliseconds: 500)); // 1 segundo
    }

    // Luego que se ocultaron todas, podés mezclar y resetear valores
    setState(() {
      valores = generarValoresMezclados();
      totalPoints = 0;
      combo = 1;
    });
  }

  updatePoints(int totalPoints) async {
    FirebaseService firebaseService = FirebaseService();
    var data = await firebaseService.updatePoints(
        "3D6JKLnpt2WcTDrU11cU3TllMrp1", "1", totalPoints);
    return data;
  }

  @override
  void initState() {
    super.initState();
    grid = int.parse(widget.datos['grid']);
    valores = generarValoresMezclados();
    revelados = List.filled(grid * grid, false); // Todos ocultos
    loadPlayerData();
  }

  List<int> generarValoresMezclados() {
    List<int> vals = [];
    int pares;

    //Pares de cartas segun la grilla
    if (widget.datos['grid'] == '4') {
      pares = 8;
    } else if (widget.datos['grid'] == '6') {
      pares = 24;
    } else {
      pares = 48;
    }
    for (int i = 1; i <= pares; i++) {
      vals.add(i);
      vals.add(i);
    }
    vals.shuffle();
    return vals;
  }

  void manejarClick(int index) async {
    //* No permitir clic si está bloqueado
    if (bloqueado || revelados[index]) return;

    setState(() {
      revelados[index] = true;
      enJuego.add(valores[index]);
      enJuego.add(index);
    });

    if (enJuego.length == 4) {
      bloqueado = true;

      if (enJuego[0] == enJuego[2]) {
        //* Success
        pointsMade = point * combo;
        totalPoints += pointsMade;
        showScoreOverlay(pointsMade);
        combo++;
      } else {
        //! Fail
        await Future.delayed(
            const Duration(seconds: 1)); //1s antes de revelar cartas
        combo = 1;
        setState(() {
          revelados[enJuego[1]] = false;
          revelados[enJuego[3]] = false;
        });
      }
      pointsMade = 0;
      bloqueado = false;
      enJuego.clear();
      if (revelados.every((elemento) => elemento)) {
        var data = await updatePoints(totalPoints);
        await modalWin(context, totalPoints, data!["points"]);
        resetGame();
      }
    }
  }

  void showScoreOverlay(int score) {
    setState(() {
      lastPointsMade = score;
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        lastPointsMade = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.datos['id_game']);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarGames(
          id_game: 1,
          id_player: '3D6JKLnpt2WcTDrU11cU3TllMrp1',
          totalPoints: totalPoints),
      body: Center(
        child: SizedBox(
          height: 400,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: grid,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: grid * grid,
            itemBuilder: (context, index) {
              return CartaAnimada(
                revelada: revelados[index],
                valor: valores[index].toString(),
                onTap: () => manejarClick(index),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Puntuación',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '$totalPoints',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  if (lastPointsMade != null)
                    ScoreOverlay(
                      scoreDelta: lastPointsMade!,
                      onComplete: () => setState(() => lastPointsMade = null),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
