import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dog1/ui/widgets/games/appBar.dart';

class GameMemotest extends StatefulWidget {
  final Map<String, dynamic> datos;
  const GameMemotest({super.key, required this.datos});

  @override
  State<GameMemotest> createState() => _GameMemotestState();
}

class _GameMemotestState extends State<GameMemotest> {
  late int grid;
  int points = 0;
  late List<int> valores;
  List<bool> revelados = [];
  List<int> enJuego = [];
  bool bloqueado = false;

  @override
  void initState() {
    super.initState();
    grid = int.parse(widget.datos['grid']);
    valores = generarValoresMezclados();
    revelados = List.filled(grid * grid, false); // Todos ocultos
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
        //* Desbloquear aunque coincidan
        points++;
        bloqueado = false;
      } else {
        //* Esperar 1 segundo antes de ocultar las cartas
        await Future.delayed(const Duration(seconds: 1));

        setState(() {
          revelados[enJuego[1]] = false;
          revelados[enJuego[3]] = false;
        });

        bloqueado = false;
      }

      enJuego.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.datos['id_game']);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarGames(
          id_game: 1, id_player: '3D6JKLnpt2WcTDrU11cU3TllMrp1'),
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
              child: Text(
                '$points',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartaAnimada extends StatefulWidget {
  final bool revelada;
  final String valor;
  final VoidCallback onTap;

  const CartaAnimada({
    super.key,
    required this.revelada,
    required this.valor,
    required this.onTap,
  });

  @override
  State<CartaAnimada> createState() => _CartaAnimadaState();
}

class _CartaAnimadaState extends State<CartaAnimada>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _escalaAnimada;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // ⬇️ Esta parte INICIALIZA _escalaAnimada correctamente
    _escalaAnimada = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(CartaAnimada oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.revelada != widget.revelada) {
      if (widget.revelada) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCara({required bool revelada}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(
            revelada
                ? 'assets/minigames/memotest/carta${widget.valor}.png'
                : 'assets/minigames/memotest/carta_oculta.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          double angulo = _animation.value * pi;
          bool mostrarCaraRevelada = angulo > (pi / 2);

          return ScaleTransition(
            scale:
                _escalaAnimada, // ⬅️ Esto hace que la carta se agrande y achique
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angulo), // ⬅️ Esto gira la carta en eje Y
              child: mostrarCaraRevelada
                  ? Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationY(pi), // ⬅️ Voltea la cara revelada
                      child: _buildCara(revelada: true),
                    )
                  : _buildCara(revelada: false),
            ),
          );
        },
      ),
    );
  }
}
