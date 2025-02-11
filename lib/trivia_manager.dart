import 'dart:math';
import 'question.dart';
import 'science_trivia.dart'; // Example categories
import 'history_trivia.dart';
import 'sports_trivia.dart';

class TriviaManager {
  List<Question> _questionBank = [];
  int _currentQuestionIndex = 0;

  // Load different question banks dynamically
  void loadTrivia(String category) {
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
    shuffleQuestions();
  }

  void shuffleQuestions() {
    _questionBank.shuffle(Random());
  }

  String getQuestionText() {
    return _questionBank[_currentQuestionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_currentQuestionIndex].questionAnswer;
  }

  bool nextQuestion() {
    if (_currentQuestionIndex < _questionBank.length - 1) {
      _currentQuestionIndex++;
      return true;
    } else {
      return false; // Quiz finished
    }
  }

  void restartQuiz() {
    _currentQuestionIndex = 0;
    shuffleQuestions();
  }
}
