import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedParticlesBackground extends StatefulWidget {
  const AnimatedParticlesBackground({super.key});

  @override
  _AnimatedParticlesBackgroundState createState() =>
      _AnimatedParticlesBackgroundState();
}

class _AnimatedParticlesBackgroundState
    extends State<AnimatedParticlesBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;
  final int numberOfParticles = 50; // Number of particles

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16), // Runs every frame (~60 FPS)
    )..addListener(() {
      setState(() {
        for (var particle in particles) {
          particle.update(); // Update all particles
        }
      });
    })
      ..repeat();

    particles = List.generate(numberOfParticles, (index) => Particle());
  }

  void _onTap(TapDownDetails details) {
    Offset tapPosition = details.localPosition;

    for (var particle in particles) {
      double distance = (Offset(particle.x, particle.y) - tapPosition).distance;

      if (distance < 100) { // If particle is within 100px of the tap
        double force = (100 - distance) / 10; // Stronger force when closer
        double angle = atan2(particle.y - tapPosition.dy, particle.x - tapPosition.dx);

        particle.vx += cos(angle) * force;
        particle.vy += sin(angle) * force;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTap, // Detect tap
      child: CustomPaint(
        painter: ParticlePainter(particles),
        child: Container(),
      ),
    );
  }
}

class Particle {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double vx = (Random().nextDouble() - 0.5) * 2; // Initial velocity in X
  double vy = (Random().nextDouble() - 0.5) * 2; // Initial velocity in Y
  double size = Random().nextDouble() * 5 + 3; // 3-8px size
  Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)]; // Random solid color
  //double friction = 0.999999999999999999999999; // Friction factor to slow down particles

  void update() {
    x += vx;
    y += vy;

    // // Apply friction to slow down over time
    // vx *= friction;
    // vy *= friction;

    // Stop particle if velocity is very low
    if (vx.abs() < 0.1) vx = 0;
    if (vy.abs() < 0.1) vy = 0;

    // Bounce off walls
    if (x < 0 || x > 400) {
      vx *= -1;
      x = x.clamp(0, 400);
    }
    if (y < 0 || y > 800) {
      vy *= -1;
      y = y.clamp(0, 800);
    }
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(particle.x, particle.y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
