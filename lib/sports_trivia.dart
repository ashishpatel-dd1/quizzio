import 'question.dart';

class SportsTrivia {
  List<Question> getQuestions() {
    return [
      Question(questionText: 'The Olympics are held every 6 years.', questionAnswer: false),
      Question(questionText: 'A soccer game lasts 90 minutes.', questionAnswer: true),
      Question(questionText: 'Basketball was invented in Canada.', questionAnswer: false), // It was invented in the USA by a Canadian.
      Question(questionText: 'The Wimbledon tournament is played on grass courts.', questionAnswer: true),
      Question(questionText: 'The Super Bowl is the championship game of the NBA.', questionAnswer: false),
      Question(questionText: 'A baseball game consists of 9 innings.', questionAnswer: true),
      Question(questionText: 'The Tour de France is a soccer competition.', questionAnswer: false),
      Question(questionText: 'Michael Phelps has won more Olympic gold medals than any other athlete.', questionAnswer: true),
      Question(questionText: 'Cricket matches can last up to five days.', questionAnswer: true),
      Question(questionText: 'The FIFA World Cup is held every four years.', questionAnswer: true),
      Question(questionText: 'The first modern Olympic Games were held in Athens in 1896.', questionAnswer: true),
      Question(questionText: 'Tennis matches at the US Open are played on grass courts.', questionAnswer: false),
      Question(questionText: 'In American football, a touchdown is worth 6 points.', questionAnswer: true),
      Question(questionText: 'The Stanley Cup is awarded in professional baseball.', questionAnswer: false), // It's for ice hockey.
      Question(questionText: 'Tiger Woods is known for playing golf.', questionAnswer: true),
      Question(questionText: 'In boxing, a match consists of three rounds.', questionAnswer: false), // Professional matches usually have more rounds.
      Question(questionText: 'The New York Yankees have won the most World Series titles in baseball history.', questionAnswer: true),
      Question(questionText: 'A marathon is exactly 26 miles long.', questionAnswer: false), // It's 26.2 miles (42.195 km).
      Question(questionText: 'LeBron James has never won an NBA championship.', questionAnswer: false),
      Question(questionText: 'The Summer Olympics include swimming events.', questionAnswer: true),
      Question(questionText: 'The sport of rugby originated in New Zealand.', questionAnswer: false), // It originated in England.
      Question(questionText: 'The NFL stands for National Football League.', questionAnswer: true),
      Question(questionText: 'Formula 1 races are run exclusively in the United States.', questionAnswer: false),
      Question(questionText: 'A standard soccer team has 11 players on the field.', questionAnswer: true),
      Question(questionText: 'The first FIFA World Cup was held in 1930.', questionAnswer: true),
    ];
  }
}
