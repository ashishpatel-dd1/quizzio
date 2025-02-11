import 'dart:math';

import 'question_bank.dart';

class GeneralTrivia {
  List<Question> questionBank = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    Question(
        questionText: 'Lightning never strikes the same place twice.',
        questionAnswer: false),
    Question(
        questionText: 'Goldfish only have a memory of three seconds.',
        questionAnswer: false),
    Question(
        questionText: 'The Great Wall of China is visible from space.',
        questionAnswer: false),
    Question(
        questionText: 'Humans share 50% of their DNA with bananas.',
        questionAnswer: true),
    Question(
        questionText: 'Octopuses have three hearts.', questionAnswer: true),
    Question(
        questionText:
            'There are more trees on Earth than stars in the Milky Way.',
        questionAnswer: true),
    Question(questionText: 'Bats are blind.', questionAnswer: false),
    Question(
        questionText: 'The Eiffel Tower can grow taller in summer.',
        questionAnswer: true),
    Question(
        questionText:
            'Water boils at the same temperature everywhere on Earth.',
        questionAnswer: false),
    Question(
        questionText: 'Venus is the hottest planet in our solar system.',
        questionAnswer: true),
    Question(questionText: 'Sharks are mammals.', questionAnswer: false),
    Question(
        questionText: 'The human body has four lungs.', questionAnswer: false),
    Question(questionText: 'Honey never spoils.', questionAnswer: true),
    Question(
        questionText: 'Bananas grow on trees.',
        questionAnswer: false), // They grow on plants, not trees.
    Question(
        questionText: 'An ostrich\'s eye is bigger than its brain.',
        questionAnswer: true),
    Question(
        questionText: 'The unicorn is the national animal of Scotland.',
        questionAnswer: true),
    Question(
        questionText:
            'The Amazon Rainforest produces 20% of the world\'s oxygen.',
        questionAnswer: true),
    Question(
        questionText:
            'The human nose can detect over 1 trillion different smells.',
        questionAnswer: true),
    Question(
        questionText: 'Coca-Cola was originally green.', questionAnswer: false),
    Question(
        questionText: 'A crocodile can stick its tongue out.',
        questionAnswer: false),
    Question(
        questionText:
            'There are more fake flamingos than real ones in the world.',
        questionAnswer: true),
    Question(
        questionText: 'The world’s smallest country is Vatican City.',
        questionAnswer: true),
    Question(
        questionText: 'The moon has earthquakes.',
        questionAnswer: true), // They're called moonquakes.
  ];

  void shuffleQuestions() {
    questionBank.shuffle(Random());
  }

  String getQuestionText(int index) {
    return questionBank[index].questionText;
  }

  bool getQuestionAnswer(int index) {
    return questionBank[index].questionAnswer;
  }

  int getTotalQuestions() {
    return questionBank.length;
  }
}