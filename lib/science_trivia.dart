import 'question.dart';

class ScienceTrivia {
  List<Question> getQuestions() {
    return [
      Question(questionText: 'Water boils at 100°C.', questionAnswer: true),
      Question(questionText: 'The Earth is flat.', questionAnswer: false),
      Question(questionText: 'Humans have four lungs.', questionAnswer: false),
      Question(
          questionText: 'Sound travels faster in air than in water.',
          questionAnswer: false),
    ];
  }
}
