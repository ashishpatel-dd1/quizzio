import 'dart:math';
import 'question.dart';
import 'science_trivia.dart';
import 'history_trivia.dart';
import 'sports_trivia.dart';

class TriviaManager {
  List<Question> _questionBank = [];
  int _currentQuestionIndex = 0;

  void loadTrivia(String category, int questionLimit) {
    switch (category.toLowerCase()) {
      case 'science':
        _questionBank = ScienceTrivia().getQuestions();
        break;
      case 'history':
        _questionBank = HistoryTrivia().getQuestions();
        break;
      case 'sports':
        _questionBank = SportsTrivia().getQuestions();
        break;
      default:
        throw Exception("Invalid category: $category");
    }

    _questionBank.shuffle(Random());

    if (questionLimit > 0 && questionLimit < _questionBank.length) {
      _questionBank = _questionBank.sublist(0, questionLimit);
    }
  }

  String getQuestionText() => _questionBank[_currentQuestionIndex].questionText;
  bool getCorrectAnswer() => _questionBank[_currentQuestionIndex].questionAnswer;

  bool nextQuestion() => ++_currentQuestionIndex < _questionBank.length - 1;
  void restartQuiz() => _currentQuestionIndex = 0;
}
