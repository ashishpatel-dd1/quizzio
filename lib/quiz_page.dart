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
  bool quizFinished = false;
  List<Icon> scoreKeeper = []; // Stores correct/wrong answer icons

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
        quizFinished = true;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      quizFinished = false;
      triviaManager.restartQuiz();
      scoreKeeper.clear(); // Reset the scorekeeper
    });
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
                        text: quizFinished
                            ? "Quiz Completed!"
                            : triviaManager.getQuestionText(),
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
            if (!quizFinished) ...[
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
            // Show Restart Button when Quiz is Finished
            if (quizFinished)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: restartQuiz,
                  child: const Text('Restart Quiz'),
                ),
              ),
            // Scorekeeper Row
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
