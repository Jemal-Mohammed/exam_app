import 'package:exam_app/screens/Result_screen.dart';
import 'package:flutter/material.dart';
import 'package:exam_app/Service.dart';
import 'package:get/get.dart';

class Exam_Screen extends StatefulWidget {
  const Exam_Screen({Key? key}) : super(key: key);

  @override
  _Exam_ScreenState createState() => _Exam_ScreenState();
}

class _Exam_ScreenState extends State<Exam_Screen> {
  Map<int, int> selectedOptions =
      {}; // Map to track selected options for each question
  List<Map<String, dynamic>> questions = []; // List to store fetched questions
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    var arguments = Get.arguments ?? 'No data received';
    var fetchedQuestions = await ExamService.getQuestions(arguments);
    setState(() {
      questions = fetchedQuestions;
    });
  }

  bool allQuestionsAnswered() {
    // Check if all questions have been answered
    return questions.every(
        (question) => selectedOptions.containsKey(questions.indexOf(question)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Exam Questions'),
        backgroundColor: Colors.indigo,
      ),
      body: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                var question = questions[index];
                int questionIndex = index;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        '${questionIndex + 1}. ${question['question']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    // Use RadioListTile for options
                    Column(
                      children: List.generate(
                        question['options'].length,
                        (optionIndex) {
                          return RadioListTile<int>(
                            title: Text(
                              question['options'][optionIndex],
                              style: TextStyle(
                                color: selectedOptions[questionIndex] ==
                                        optionIndex
                                    ? Colors
                                        .green // Set color to green for selected option
                                    : Colors.white,
                              ),
                            ),
                            value: optionIndex,
                            groupValue: selectedOptions[questionIndex],
                            onChanged: (value) {
                              setState(() {
                                selectedOptions[questionIndex] = value!;
                                if (value == question['correctAnswer']) {
                                  score = score + 1;
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(
            onPressed: allQuestionsAnswered()
                ? () => Get.to(Result(), arguments: score)
                : null,
            child: Text("Submit"),
          ),
        ),
      ),
    );
  }
}
