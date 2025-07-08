import 'package:flutter/material.dart';

class ScoreOverlay extends StatefulWidget {
  final int scoreDelta;
  final VoidCallback onComplete;

  const ScoreOverlay({
    super.key,
    required this.scoreDelta,
    required this.onComplete,
  });

  @override
  State<ScoreOverlay> createState() => _ScoreOverlayState();
}

class _ScoreOverlayState extends State<ScoreOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _opacity = Tween(begin: 1.0, end: 0.0).animate(_controller);
    _offset = Tween(begin: const Offset(0, -0.5), end: const Offset(0, -3))
        .animate(_controller);

    _controller.forward().then((_) => widget.onComplete());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _opacity,
        child: Text(
          '+${widget.scoreDelta}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
