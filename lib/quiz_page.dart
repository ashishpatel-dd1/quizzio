import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'trivia_manager.dart';

class QuizPage extends StatefulWidget {
  final String selectedCategory;
  final int questionCount;

  const QuizPage({super.key, required this.selectedCategory, required this.questionCount});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  TriviaManager triviaManager = TriviaManager();
  List<Icon> scoreKeeper = [];

  @override
  void initState() {
    super.initState();
    triviaManager.loadTrivia(widget.selectedCategory, widget.questionCount);
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = triviaManager.getCorrectAnswer();

    setState(() {
      scoreKeeper.add(
        Icon(userAnswer == correctAnswer ? Icons.check : Icons.close, color: userAnswer == correctAnswer ? Colors.green : Colors.red, size: 30),
      );

      if (!triviaManager.nextQuestion()) {
        showCompletionAlert();
      }
    });
  }

  void showCompletionAlert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Quiz Completed!",
      desc: "Your Score: ${scoreKeeper.where((icon) => icon.color == Colors.green).length}/${widget.questionCount}",
      style: AlertStyle(isOverlayTapDismiss: false, descStyle: const TextStyle(fontSize: 14)),
      buttons: [
        DialogButton(
          onPressed: () {
            setState(() {
              triviaManager.restartQuiz();
              scoreKeeper.clear();
            });
            Navigator.pop(context);
          },
          color: Colors.green,
          child: const Text("Restart Quiz", style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: Colors.red,
          child: const Text("Home", style: TextStyle(color: Colors.white, fontSize: 16)),
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
        title: Text(widget.selectedCategory, style: const TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildQuestionSection(),
            _buildAnswerButton(true, Colors.green),
            _buildAnswerButton(false, Colors.red),
            _buildScoreKeeper(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(triviaManager.getQuestionText(), style: const TextStyle(fontSize: 22.0, color: Colors.white), textAlign: TextAlign.center),
      ),
    );
  }

  Widget _buildAnswerButton(bool isTrue, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color, padding: const EdgeInsets.all(15.0)),
        onPressed: () => checkAnswer(isTrue),
        child: Text(isTrue ? 'True' : 'False', style: const TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );
  }

  Widget _buildScoreKeeper() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: scoreKeeper),
    );
  }
}
