import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Function() onTap;
  final Widget child;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _controller.forward();
        await Future.delayed(const Duration(milliseconds: 200), () {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.9).animate(_controller),
        child: widget.child,
      ),
    );
  }
}
