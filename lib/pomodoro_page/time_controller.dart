import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro_app/timer_service.dart';

class TimeController extends StatefulWidget {
  const TimeController({Key? key}) : super(key: key);

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);

    void togglePlayButton() {
      if (provider.timerPlaying) {
        provider.pause();
      } else {
        provider.start();
      }
    }

    return Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          onPressed: () {
            togglePlayButton();
          },
          icon: provider.timerPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
          color: Colors.white,
          iconSize: 55,
        ),
      ),
    );
  }
}
