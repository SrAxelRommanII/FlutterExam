import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/guide_model.dart';

class ToolsView extends StatelessWidget {
  final RepairGuide guide;

  const ToolsView({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Guía'),
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guide.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 8),
            Text(
              guide.description,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const Divider(height: 40),

            const Row(
              children: [
                Icon(Icons.handyman, color: Colors.orange),
                SizedBox(width: 10),
                Text('Herramientas Necesarias', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            // CORRECCIÓN: Quitamos el .toList() porque el spread operator (...) ya maneja el iterable
            ...guide.tools.map((item) => Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.build, size: 20),
                title: Text(item),
              ),
            )),

            const SizedBox(height: 30),

            Row(
              children: [
                // CORRECCIÓN: Cambiamos 'Menu_book' por 'menu_book' (minúscula)
                const Icon(Icons.menu_book, color: Colors.green),
                const SizedBox(width: 10),
                const Text('Instrucciones y Consejos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            ...guide.steps.asMap().entries.map((entry) => Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                // CORRECCIÓN: Usamos withValues para evitar el aviso de 'deprecated'
                color: Colors.blue.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.blue,
                    child: Text('${entry.key + 1}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: const TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}