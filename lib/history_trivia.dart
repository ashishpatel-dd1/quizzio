import 'question.dart';

class HistoryTrivia {
  List<Question> getQuestions() {
    return [
      Question(questionText: 'World War II ended in 1945.', questionAnswer: true),
      Question(questionText: 'The Great Wall of China is visible from space.', questionAnswer: false),
      Question(questionText: 'The first Olympic Games were held in 776 BC.', questionAnswer: true),
      Question(questionText: 'Napoleon was taller than the average Frenchman of his time.', questionAnswer: false),
      Question(questionText: 'The United States declared independence in 1776.', questionAnswer: true),
      Question(questionText: 'The Titanic sank in 1912.', questionAnswer: true),
      Question(questionText: 'Julius Caesar was the first emperor of Rome.', questionAnswer: false),
      Question(questionText: 'The Wright brothers made the first successful airplane flight in 1903.', questionAnswer: true),
      Question(questionText: 'The Cold War was a direct military conflict between the US and USSR.', questionAnswer: false),
      Question(questionText: 'Cleopatra was an Egyptian by birth.', questionAnswer: false),
      Question(questionText: 'The Berlin Wall fell in 1989.', questionAnswer: true),
      Question(questionText: 'The Declaration of Independence was signed in New York.', questionAnswer: false),
      Question(questionText: 'Genghis Khan founded the Mongol Empire.', questionAnswer: true),
      Question(questionText: 'The French Revolution began in 1789.', questionAnswer: true),
      Question(questionText: 'The Industrial Revolution started in the 20th century.', questionAnswer: false),
      Question(questionText: 'The United Nations was founded after World War I.', questionAnswer: false),
      Question(questionText: 'Leonardo da Vinci painted the Mona Lisa.', questionAnswer: true),
      Question(questionText: 'Abraham Lincoln was the first president of the United States.', questionAnswer: false),
      Question(questionText: 'World War I started in 1914.', questionAnswer: true),
      Question(questionText: 'The Great Depression began in 1929.', questionAnswer: true),
      Question(questionText: 'The Renaissance began in England.', questionAnswer: false),
      Question(questionText: 'Christopher Columbus discovered America in 1492.', questionAnswer: true),
      Question(questionText: 'The Trojan War is a confirmed historical event.', questionAnswer: false),
      Question(questionText: 'Albert Einstein developed the theory of relativity.', questionAnswer: true),
      Question(questionText: 'The United Kingdom left the European Union in 2016.', questionAnswer: false), // It voted to leave in 2016 but officially left in 2020.
    ];
  }
}
