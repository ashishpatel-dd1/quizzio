import 'package:flutter/material.dart';
import 'quiz_page.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final List<String> categories = ['Science', 'History', 'Sports'];

  void _showQuestionSelectionDialog(String category) {
    int selectedQuestions = 10; // Default number

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Questions for $category"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return DropdownButton<int>(
                value: selectedQuestions,
                items: [5, 10, 15, 20, 25].map((int number) {
                  return DropdownMenuItem<int>(
                    value: number,
                    child: Text(number.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    selectedQuestions = newValue!;
                  });
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(selectedCategory: category, questionCount: selectedQuestions),
                  ),
                );
              },
              child: const Text("Start Quiz"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Category")),
      body: ListView(
        children: categories.map((category) {
          return ListTile(
            title: Text(category),
            onTap: () => _showQuestionSelectionDialog(category),
          );
        }).toList(),
      ),
    );
  }
}
