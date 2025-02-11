import 'package:flutter/material.dart';

import 'general_trivia.dart';

GeneralTrivia quizBrain = GeneralTrivia();
void main() => runApp(const Quizzio());

class Quizzio extends StatelessWidget {
  const Quizzio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const _QuizPage(),
          ),
        ),
      ),
    );
  }
}

class _QuizPage extends StatefulWidget {
  const _QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<_QuizPage> {
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  bool quizFinished = false;

  @override
  void initState() {
    super.initState();
    quizBrain.shuffleQuestions(); // Shuffle the questions when the app starts
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer(questionNumber);

    if (userAnswer == correctAnswer) {
      print('You got it Right!');
    } else {
      print('Your answer is wrong');
    }

    setState(() {
      if (questionNumber < quizBrain.getTotalQuestions() - 1) {
        questionNumber++;
      } else {
        quizFinished = true;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      questionNumber = 0;
      quizFinished = false;
      quizBrain.shuffleQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return quizFinished
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Quiz Completed!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: restartQuiz,
                  child: const Text('Restart Quiz'),
                ),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain
                          .getQuestionText(questionNumber), // ✅ Correct method
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    onPressed: () => checkAnswer(true),
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(15.0),
                    ),
                    onPressed: () => checkAnswer(false),
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
