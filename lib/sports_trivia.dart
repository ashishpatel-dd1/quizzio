import 'question.dart';

class SportsTrivia {
  List<Question> getQuestions() {
    return [
      Question(questionText: 'The Olympics are held every 6 years.', questionAnswer: false),
      Question(questionText: 'A soccer game lasts 90 minutes.', questionAnswer: true),
      Question(questionText: 'Basketball was invented in Canada.', questionAnswer: false),
      Question(questionText: 'The Wimbledon tournament is played on grass courts.', questionAnswer: true),
    ];
  }
}
