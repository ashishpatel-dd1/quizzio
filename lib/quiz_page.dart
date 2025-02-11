import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'trivia_manager.dart';

class QuizPage extends StatefulWidget {
  final String selectedCategory;

  const QuizPage({super.key, required this.selectedCategory});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  TriviaManager triviaManager = TriviaManager();
  List<Icon> scoreKeeper = [];

  @override
  void initState() {
    super.initState();
    triviaManager.loadTrivia(widget.selectedCategory);
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = triviaManager.getCorrectAnswer();

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green, size: 30));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red, size: 30));
      }

      if (!triviaManager.nextQuestion()) {
        showCompletionAlert(); // Show alert when quiz finishes
      }
    });
  }

  void showCompletionAlert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Quiz Completed!",
      desc: "You've completed the quiz. What would you like to do next?",
      style: AlertStyle(
        isOverlayTapDismiss: false, // Prevent accidental dismiss
        descStyle: const TextStyle(fontSize: 16), // Adjust description size
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            setState(() {
              triviaManager.restartQuiz();
              scoreKeeper.clear();
            });
            Navigator.pop(context); // Close alert
          },
          width: 150, // Adjust width
          color: Colors.green,
          child: const Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context); // Close alert
            Navigator.pop(context); // Go back to home screen
          },
          width: 150, // Adjust width
          color: Colors.red,
          child: const Text(
            "Home", // Shorter text fits better
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    ).show();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.selectedCategory,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: triviaManager.getQuestionText(),
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
