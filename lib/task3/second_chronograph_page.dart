import 'dart:async';
import 'package:flutter/material.dart';

class SecondChronographPage extends StatefulWidget {
  const SecondChronographPage({super.key});

  @override
  _SecondChronographPageState createState() => _SecondChronographPageState();
}

class _SecondChronographPageState extends State<SecondChronographPage> {
  final _stopWatch = Stopwatch();
  var _elapsedTime = '00:00:00';
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('task 3'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  _elapsedTime,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: startWatch,
                      child: Icon(Icons.play_arrow),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: stopWatch,
                      child: Icon(Icons.stop),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.blue,
                      onPressed: resetWatch,
                      child: Icon(Icons.refresh),
                    ),
                  ],
                )
              ],
            ),
        ),
    );
  }

  void startWatch() {
    _stopWatch.start();
    _timer = Timer.periodic(
      Duration(milliseconds: 1000),
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
    var timeSoFar = _stopWatch.elapsedMilliseconds;
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

    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hoursStr = (hours % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  void dispose() {
    _stopWatch.stop();
    _timer?.cancel();
    super.dispose();
  }
}