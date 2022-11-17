import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro_app/pomodoro_page/progress_widget.dart';
import 'package:pomodoro_app/pomodoro_page/time_controller.dart';
import 'package:pomodoro_app/pomodoro_page/timer_options.dart';
import 'package:pomodoro_app/pomodoro_page/timer_cards_section.dart';
import 'package:pomodoro_app/timer_service.dart';
import 'package:pomodoro_app/utils.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    final currentState = provider.currentState;

    return Scaffold(
      backgroundColor: renderColor(currentState),
      //AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(currentState),
        title: Text(
          'POMOTIMER',
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              provider.reset();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          )
        ],
      ),

      //body
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimerOptions(),
              SizedBox(
                height: 40,
              ),
              TimeController(),
              SizedBox(
                height: 30,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
