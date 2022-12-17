import 'package:flutter/material.dart';

import 'main.dart';

class FinishSrcreen extends StatefulWidget {
  const FinishSrcreen({Key? key, required this.score}) : super(key: key);
  final int score;
  @override
  State<FinishSrcreen> createState() => _FinishSrcreenState();
}

class _FinishSrcreenState extends State<FinishSrcreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('WELDONE'),
          Text('Your score is ${widget.score}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Quiz App'),
                  ),
                );
              },
              child: const Text('back to HOME'))
        ],
      ),
    ));
  }
}
