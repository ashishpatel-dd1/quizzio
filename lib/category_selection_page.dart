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
    {'name': 'Science', 'icon': Icons.science, 'color': Colors.blueAccent},
    {'name': 'History', 'icon': Icons.history_edu, 'color': Colors.brown},
    {'name': 'Sports', 'icon': Icons.sports_soccer, 'color': Colors.green},
  ];

  final List<Color> _backgroundColors = [Colors.deepPurple, Colors.black, Colors.indigo];
  int _colorIndex = 0;

  @override
  void initState() {
    super.initState();
    _startBackgroundAnimation();
  }

  void _startBackgroundAnimation() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _backgroundColors.length;
      });
      _startBackgroundAnimation();
    });
  }

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
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // Glassmorphic Effect
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB((0.2 * 255).toInt(), 255, 255, 255), // ✅ Fixed
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color.fromARGB((0.3 * 255).toInt(), 255, 255, 255), // ✅ Fixed
                  ),
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
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.4)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: selectedQuestions,
                              dropdownColor: Colors.grey.shade900,
                              icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 28),
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(15),
                              items: [5, 10, 15, 20, 25].map((int number) {
                                return DropdownMenuItem<int>(
                                  value: number,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                    child: Text(
                                      number.toString(),
                                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedQuestions = newValue!;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB((0.8 * 255).toInt(), 255, 82, 82), // ✅ Fixed
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          ),
                          child: const Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        ElevatedButton(
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: categoryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          ),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Choose a Quiz", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _backgroundColors[_colorIndex],
              _backgroundColors[(_colorIndex + 1) % _backgroundColors.length]
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
