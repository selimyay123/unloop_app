import 'package:flutter/material.dart';
import 'package:unloop/widgets/unloop_container.dart';

class StatCard extends StatelessWidget {
  final String title;
  final int value;
  final String info;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Tooltip(
        message: info,
        triggerMode: TooltipTriggerMode.tap,
        showDuration: const Duration(seconds: 3),
        child: UnloopContainer(
          marginValue: 16,
          child: Column(
            children: [
              Text(title),
              Text(value.toString(), style: TextStyle(fontSize: 42)),
            ],
          ),
        ),
      ),
    );
  }
}
