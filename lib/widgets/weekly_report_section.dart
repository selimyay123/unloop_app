import 'package:flutter/material.dart';
import 'package:unloop/widgets/unloop_container.dart';

class WeeklyReportSection extends StatelessWidget {
  const WeeklyReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return UnloopContainer(
      marginValue: 16,
      child: Center(
        child: Text("Weekly Report", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
