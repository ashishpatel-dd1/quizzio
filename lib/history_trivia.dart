import 'question.dart';

class HistoryTrivia {
  List<Question> getQuestions() {
    return [
      Question(
          questionText: 'World War II ended in 1945.', questionAnswer: true),
      Question(questionText: 'The Great Wall of China is visible from space.', questionAnswer: false),
      Question(questionText: 'The first Olympic Games were held in 776 BC.', questionAnswer: true),
      Question(questionText: 'Napoleon was taller than the average Frenchman of his time.', questionAnswer: false),
    ];
  }
}
