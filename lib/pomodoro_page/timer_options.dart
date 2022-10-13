import 'package:flutter/material.dart';
import 'package:pomodoro_app/timer_service.dart';
import 'package:pomodoro_app/utils.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TimerOptions extends StatelessWidget {
  const TimerOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeService>(context);
    final currentState = provider.currentState;

    return SingleChildScrollView(
      controller: ScrollController(
        initialScrollOffset: 80,
      ),
      scrollDirection: Axis.horizontal,
      child: 
      //Row of all time options' containers
      Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: 
            //Each specific container having a time option
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: (int.parse(time) == provider.selectedTime)
                  ? BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 3,
                        color: Colors.white30,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )
                  : BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.white30,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
              //Text for time option
              child: Center(
                  child: Text(
                int.parse(time).toString(),
                style: textStyle(
                    25,
                    (int.parse(time) == provider.selectedTime)
                        ? renderColor(currentState)
                        : Colors.white,
                    FontWeight.w700),
              )),
            ),
          );
        }).toList(),
      ),
    );
  }
}
