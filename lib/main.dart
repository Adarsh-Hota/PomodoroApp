import 'package:flutter/material.dart';
import 'package:pomodoro_app/pomodoro_screen.dart';
import 'package:pomodoro_app/timer_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TimeService>(
    create: (_) => TimeService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroScreen(),
    );
  }
}
