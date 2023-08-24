import 'dart:async';
import 'package:flutter/material.dart';

class SecondChronographPage extends StatefulWidget {
  const SecondChronographPage({super.key});

  @override
  State<SecondChronographPage> createState() => _SecondChronographPageState();
}

class _SecondChronographPageState extends State<SecondChronographPage> {
  final _stopWatch = Stopwatch();
  var _elapsedTime = '00:00:00';
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('task 3',),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  _elapsedTime,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: startWatch,
                      child: const Icon(Icons.play_arrow,),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: stopWatch,
                      child: const Icon(Icons.stop,),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.blue,
                      onPressed: resetWatch,
                      child: const Icon(Icons.refresh,),
                    ),
                  ],
                ),
              ],
            ),
        ),
    );
  }

  void startWatch() {
    _stopWatch.start();
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000,),
      updateTime,
    );
  }

  void stopWatch() {
    _stopWatch.stop();
    setTime();
  }

  void resetWatch() {
    _stopWatch.reset();
    setTime();
  }

  void setTime() {
    final timeSoFar = _stopWatch.elapsedMilliseconds;
    setState(() {
      _elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  void updateTime(Timer timer) {
    if (_stopWatch.isRunning) {
      setState(() {
        _elapsedTime = transformMilliSeconds(_stopWatch.elapsedMilliseconds);
      });
    }
  }

  String transformMilliSeconds(int milliseconds) {

    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();
    final hours = (minutes / 60).truncate();

    final minutesStr = (minutes % 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    final hoursStr = (hours % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    _stopWatch.stop();
    _timer?.cancel();
    super.dispose();
  }
}
