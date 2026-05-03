import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/category_list_view.dart'; // <--- Esta es la clave


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDoc - Categorías'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '¿Qué deseas reparar hoy?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 columnas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCategoryCard(context, 'Motor', Icons.settings_suggest),
                  _buildCategoryCard(context, 'Frenos', Icons.e_mobiledata),
                  _buildCategoryCard(context, 'Llantas', Icons.tire_repair),
                  _buildCategoryCard(context, 'Fluidos', Icons.water_drop),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget reutilizable (Punto 5: Componentización)
  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryListView(categoryName: title),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueGrey),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}