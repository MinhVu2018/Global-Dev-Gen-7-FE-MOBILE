import 'package:flutter/material.dart';
import 'package:quiz_app/finish_screen.dart';

import 'question.dart';

// ignore: must_be_immutable
class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.questionList}) : super(key: key);

  final List<Question> questionList;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int curQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Question number: ${curQuestionIndex + 1}/${widget.questionList.length}'),
            const SizedBox(height: 20),
            Text(widget.questionList[curQuestionIndex].question),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Center(
                      child: Text(
                          widget.questionList[curQuestionIndex].answers[0]),
                    )),
                const SizedBox(width: 30),
                Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Center(
                      child: Text(
                          widget.questionList[curQuestionIndex].answers[1]),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            (widget.questionList[curQuestionIndex].type == 'multiple')
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: Center(
                            child: Text(widget
                                .questionList[curQuestionIndex].answers[2]),
                          )),
                      const SizedBox(width: 30),
                      Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          child: Center(
                            child: Text(widget
                                .questionList[curQuestionIndex].answers[3]),
                          )),
                    ],
                  )
                : Container(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => foo(),
              child: const Text('Continue >'),
            ),
          ],
        ),
      ),
    );
  }

  void foo() {
    curQuestionIndex++;
    if (curQuestionIndex == widget.questionList.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FinishSrcreen(score: 0),
        ),
      );
    } else {
      setState(() {});
    }
  }
}
