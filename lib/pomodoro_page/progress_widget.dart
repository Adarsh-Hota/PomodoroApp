import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro_app/timer_service.dart';
import 'package:pomodoro_app/utils.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    final round = provider.rounds;
    final goal = provider.goals;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$round/4',
              style: textStyle(25, Colors.grey[350]!, FontWeight.bold),
            ),
            Text(
              'ROUND',
              style: textStyle(25, Colors.grey[350]!, FontWeight.bold),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$goal/12',
              style: textStyle(25, Colors.grey[350]!, FontWeight.bold),
            ),
            Text(
              'GOAL',
              style: textStyle(25, Colors.grey[350]!, FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
