import 'package:flutter/material.dart';

class UnloopContainer extends StatelessWidget {
  final Widget child;
  final double marginValue;

  const UnloopContainer({
    super.key,
    required this.child,
    required this.marginValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(marginValue),
      child: child,
    );
  }
}
