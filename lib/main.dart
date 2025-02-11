import 'package:flutter/material.dart';
import 'quiz_page.dart';

void main() => runApp(const Quizzio());

class Quizzio extends StatelessWidget {
  const Quizzio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Removes debug banner
      home: HomeScreen(), // Ensures Navigator is available
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Quiz Category',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(selectedCategory: 'Science'),
                    ),
                  );
                },
                child: const Text('Science Trivia'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(selectedCategory: 'History'),
                    ),
                  );
                },
                child: const Text('History Trivia'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizPage(selectedCategory: 'Sports'),
                    ),
                  );
                },
                child: const Text('Sports Trivia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
