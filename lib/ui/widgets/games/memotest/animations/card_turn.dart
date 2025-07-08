import 'dart:math';
import 'package:flutter/material.dart';

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
            scale: _escalaAnimada,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angulo),
              child: mostrarCaraRevelada
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
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
