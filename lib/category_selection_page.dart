import 'package:flutter/material.dart';
import 'quiz_page.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Science', 'icon': Icons.science, 'color': Colors.blueAccent},
    {'name': 'History', 'icon': Icons.history_edu, 'color': Colors.brown},
    {'name': 'Sports', 'icon': Icons.sports_soccer, 'color': Colors.green},
  ];

  void _showQuestionSelectionDialog(String category, Color categoryColor) {
    int selectedQuestions = 10;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: Text("Questions for $category", style: const TextStyle(color: Colors.white)),
          content: StatefulBuilder(
            builder: (context, setState) {
              return DropdownButton<int>(
                dropdownColor: Colors.grey.shade800,
                value: selectedQuestions,
                style: const TextStyle(color: Colors.white),
                items: [5, 10, 15, 20, 25].map((int number) {
                  return DropdownMenuItem<int>(
                    value: number,
                    child: Text(number.toString(), style: const TextStyle(color: Colors.white)),
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
              child: const Text("Cancel", style: TextStyle(color: Colors.redAccent)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: categoryColor),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizPage(selectedCategory: category, questionCount: selectedQuestions),
                  ),
                );
              },
              child: const Text("Start Quiz", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Choose a Quiz", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: GestureDetector(
                onTap: () => _showQuestionSelectionDialog(category['name'], category['color']),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: category['color'],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: category['color'].withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(category['icon'], color: Colors.white, size: 35),
                      Text(
                        category['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
