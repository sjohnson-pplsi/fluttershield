import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  static const route = "/stopwatch";
  final String? name;
  final String? email;

  const StopWatch({super.key, this.name, this.email});

  @override
  State createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final laps = <int>[];
  bool isTicking = true;
  int milliseconds = 0;
  Timer? timer;
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), _onTick);

    setState(() {
      laps.clear();
      milliseconds = 0;
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer?.cancel();

    setState(() {
      isTicking = false;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stopwatch')),
      body: Column(
        children: [
          Expanded(
            child: _buildCounter(context),
          ),
          Expanded(child: _buildLapDisplay())
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Laps ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(_secondsText(milliseconds),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white)),
          const SizedBox(
            height: 20,
          ),
          _buildControls()
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: _startTimer,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text("Start")),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
            onPressed: _lap,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            child: const Text("Lap")),
        const SizedBox(
          width: 20,
        ),
        TextButton(
            onPressed: _stopTimer,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Stop'))
      ],
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
          controller: scrollController,
          itemExtent: itemHeight,
          itemCount: laps.length,
          itemBuilder: (context, index) {
            final milliseconds = laps[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 50),
              title: Text('Lap ${index + 1}'),
              trailing: Text(_secondsText(milliseconds)),
            );
          }),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
