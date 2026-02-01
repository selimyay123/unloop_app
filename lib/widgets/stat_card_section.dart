import 'package:flutter/material.dart';
import 'package:unloop/widgets/stat_card.dart';

class StatCardSection extends StatelessWidget {
  const StatCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatCard(
          title: "Daily Win",
          value: 8,
          info: "This shows how many times you`ve resisted target apps today.",
        ),
        StatCard(
          title: "Daily Lose",
          value: 12,
          info:
              "This shows how many times you`ve yielded to target apps today.",
        ),
      ],
    );
  }
}
