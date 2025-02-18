import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'animated_particles.dart';
import 'category_selection_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock the app in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Allow only portrait mode
  ]).then((_) {
    runApp(const Quizzio());
  });
}

class Quizzio extends StatelessWidget {
  const Quizzio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> _backgroundColors = [
    Colors.deepPurple,
    Colors.blueAccent,
    Colors.indigo,
    Colors.black
  ];
  late Timer _timer;
  int _colorIndex = 0;

  @override
  void initState() {
    super.initState();
    _startBackgroundAnimation();
  }

  void _startBackgroundAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _backgroundColors.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1️⃣ Animated Color Gradient
          AnimatedContainer(
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
          ),
          // 2️⃣ Floating Particles Animation
          const AnimatedParticlesBackground(),
          // 3️⃣ Foreground Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.quiz, size: 100, color: Colors.white),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to Quizzio!',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Test your knowledge in various categories',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategorySelectionPage()),
                      );
                    },
                    child: const Text('Start Quiz', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
