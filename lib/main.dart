import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/splash_view.dart';


void main() {
  runApp(const AutoDocApp());
}

class AutoDocApp extends StatelessWidget {
  const AutoDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoDoc: Guía de Reparación',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // La pantalla que se verá apenas abra la app
      home: const SplashView(), 
    );
  }
}