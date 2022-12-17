// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/quiz_screen.dart';
import 'dart:convert';

import 'const.dart';
import 'question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String categoryValue = categoryList[0];
  String typeValue = typeList[0];
  String levelValue = levelList[0];
  final TextEditingController minTextController = TextEditingController();
  final TextEditingController secTextController = TextEditingController();
  final TextEditingController numQuestionController = TextEditingController();

  String warningText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                isExpanded: true,
                value: levelValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    levelValue = value!;
                  });
                },
                items: levelList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: typeValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    typeValue = value!;
                  });
                },
                items: typeList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: categoryValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    categoryValue = value!;
                  });
                },
                items:
                    categoryList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Minute",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: TextField(
                          controller: minTextController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: '00',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Second",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: TextField(
                          controller: secTextController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: '00',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Number of question:'),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextField(
                      controller: numQuestionController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '00',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => func(),
                child: const Text("Let's go"),
              ),
              Text(
                warningText,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> func() async {
    if (numQuestionController.text == "") {
      setState(() {
        warningText = "Please enter number of question !";
      });
      return;
    }
    setState(() {
      warningText = "";
    });

    Map<String, dynamic> query = {};
    query['amount'] = numQuestionController.text;

    if (categoryValue != 'Any category') {
      query['category'] = cateIndex[categoryValue].toString();
    }

    if (levelValue != 'Any level') {
      query['difficulty'] = levelValue;
    }

    if (typeValue == 'Multiple choice') {
      query['type'] = 'multiple';
    } else if (typeValue == 'True/False') {
      query['type'] = 'boolean';
    }

    // int numQuestion = int.parse(numQuestionController.text == "" ?? '10');
    var url = Uri.https('opentdb.com', 'api.php', query);
    print('working...');
    var response = await http.post(url);
    Map<String, dynamic> valueMap = json.decode(response.body);

    List<Question> questionList = [];
    for (int i = 0; i < int.parse(query['amount']); i++) {
      questionList.add(Question.fromJson(valueMap['results'][i]));
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(questionList: questionList),
      ),
    );
  }
}
