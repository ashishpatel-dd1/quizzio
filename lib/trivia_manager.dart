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

    // Ensure we don't try to get more questions than available
    if (questionLimit > _questionBank.length) {
      questionLimit = _questionBank.length; // Limit to available questions
    }

    _questionBank = _questionBank.sublist(0, questionLimit);
    _currentQuestionIndex = 0; // Reset index after loading questions
  }

  String getQuestionText() {
    if (_questionBank.isEmpty) return "No questions available.";
    return _questionBank[_currentQuestionIndex].questionText;
  }

  bool getCorrectAnswer() {
    if (_questionBank.isEmpty) return false;
    return _questionBank[_currentQuestionIndex].questionAnswer;
  }

  bool nextQuestion() {
    if (_currentQuestionIndex + 1 < _questionBank.length) {
      _currentQuestionIndex++;
      return true;
    }
    return false; // No more questions left
  }

  void restartQuiz() {
    _currentQuestionIndex = 0;
  }
}
