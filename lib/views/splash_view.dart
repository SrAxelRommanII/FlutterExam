import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueGrey[900], // Un color serio automotriz
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.build_circle, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'AUTODOC',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Tu guía mecánica de confianza',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navegación básica requerida en el punto 4
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              child: const Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}