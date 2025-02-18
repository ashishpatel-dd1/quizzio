import 'package:flutter/material.dart';
import 'dart:ui';
import 'quiz_page.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key});

  @override
  _CategorySelectionPageState createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Science',
      'icon': Icons.science,
      'color': Colors.blueAccent,
      'backgroundImage': "assets/backgrounds/atom-1674878_1280.webp"
    },
    {
      'name': 'History',
      'icon': Icons.history_edu,
      'color': Colors.brown,
      'backgroundImage': "assets/backgrounds/history.jpg"
    },
    {
      'name': 'Sports',
      'icon': Icons.sports_soccer,
      'color': Colors.green,
      'backgroundImage': "assets/backgrounds/sport.jpeg"
    },
  ];

  final Color _backgroundColor = Colors.black;

  void _showQuestionSelectionDialog(String category, Color categoryColor) {
    int selectedQuestions = 10;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Select Number of Questions",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<int>(
                          value: selectedQuestions,
                          dropdownColor: Colors.grey.shade900,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 28),
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                          isExpanded: true,
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.8)),
                          child: const Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPage(
                                  selectedCategory: category,
                                  questionCount: selectedQuestions,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: categoryColor),
                          child: const Text("Start Quiz", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose a Quiz"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: _backgroundColor,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var category = categories[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: GestureDetector(
                onTap: () => _showQuestionSelectionDialog(category['name'], category['color']),
                child: Container(
                  height: 160,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
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
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (category.containsKey('backgroundImage'))
                        Image.asset(
                          category['backgroundImage'],
                          fit: BoxFit.cover,
                        ),
                      Container(
                        decoration: BoxDecoration(
                          color: category['color'].withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper alignment
                          children: [
                            // Category Name (VERTICAL) + Icon
                            Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    category['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //const SizedBox(width: 10), // Space between name and icon
                                Icon(category['icon'], color: Colors.white, size: 35),
                              ],
                            ),

                            // Arrow Icon aligned to the end
                            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
