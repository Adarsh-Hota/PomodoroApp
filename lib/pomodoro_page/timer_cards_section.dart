import 'package:flutter/material.dart';
import 'package:pomodoro_app/timer_service.dart';
import 'package:pomodoro_app/utils.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    final heading = provider.currentState;
    final minutes = ((provider.currentDuration ~/ 60).toString()).length == 1
        ? "0${provider.currentDuration ~/ 60}"
        : (provider.currentDuration ~/ 60).toString();
    final seconds =
        ((provider.currentDuration % 60).round().toString()).length == 1
            ? "0${(provider.currentDuration % 60).round()}"
            : (provider.currentDuration % 60).round().toString();
    final currentState = provider.currentState;

    return Column(
      children: [
        //Text heading
        Text(
          heading,
          style: textStyle(35, Colors.white, FontWeight.w700),
        ),

        //Space
        const SizedBox(
          height: 20,
        ),

        //Cards section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Left card
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: Center(
                  child: Text(
                minutes,
                style:
                    textStyle(70, renderColor(currentState), FontWeight.bold),
              )),
            ),

            // Space
            const SizedBox(
              width: 10,
            ),

            //Text -> :
            Text(
              ':',
              style: textStyle(60, (Colors.red[200])!, FontWeight.bold),
            ),

            //Space
            const SizedBox(
              width: 10,
            ),

            //Right card
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: Center(
                  child: Text(
                seconds,
                style: textStyle(70, renderColor(currentState), FontWeight.bold),
              )),
            ),
          ],
        )
      ],
    );
  }
}
