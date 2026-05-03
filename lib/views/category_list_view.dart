import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/guide_model.dart';
import 'package:flutter_application_1/views/tools_view.dart';

final List<RepairGuide> guidesMock = [
  // --- SECCIÓN DE MOTOR ---
  RepairGuide(
    title: 'Cambio de Aceite y Filtro',
    description: 'El "pulmón" de tu motor. Clave para evitar fricción interna.',
    category: 'Motor',
    tools: ['Llave de 14mm/17mm', 'Llave de filtro', 'Bandeja de drenaje', 'Embudo'],
    steps: [
      'Marcas Recomendadas: Mobil 1, Castrol Edge, Shell Helix (Sintéticos).',
      'Frecuencia: Cada 5,000 km (Mineral) o 10,000 km (Sintético).',
      'Tipos: 5W-30 (Autos nuevos), 10W-30 (Climas cálidos), 20W-50 (Motores con alto kilometraje).',
      'Proceso: Calienta el motor 5 min, drena el aceite por el cárter, cambia el filtro, y rellena con el litraje especificado en tu manual.'
    ],
  ),
  RepairGuide(
    title: 'Diferencia entre Aceites',
    description: 'Aprende a elegir entre Mineral, Semisintético y Sintético.',
    category: 'Motor',
    tools: ['Manual del usuario'],
    steps: [
      'Mineral: Derivado directo del petróleo. Barato pero dura poco (3-5 meses).',
      'Sintético: Creado en laboratorio. Resiste mejor el calor y protege más el motor (1 año/10k km).',
      'Semisintético: Mezcla equilibrada para motores modernos con uso moderado.',
      'Dato: Nunca bajes la viscosidad si tu motor ya está acostumbrado a un aceite grueso.'
    ],
  ),

  // --- SECCIÓN DE FRENOS ---
  RepairGuide(
    title: 'Pastillas de Freno',
    description: 'Seguridad máxima. Marcas como Brembo, Bosch o Akebono.',
    category: 'Frenos',
    tools: ['Gato y torres', 'Llave de cruz', 'Prensa de pistón de freno'],
    steps: [
      'Duración: Revisar cada 20,000 km. Cambiar si la pasta mide menos de 3mm.',
      'Señales de falla: Chirridos agudos, vibración al frenar o pedal "esponjoso".',
      'Marcas: Bosch (Durabilidad), Brembo (Rendimiento), Wagner (Confort).',
      'Cuidado: Al cambiar pastillas, verifica si el disco necesita rectificación.'
    ],
  ),

  // --- SECCIÓN DE LLANTAS ---
  RepairGuide(
    title: 'Cuidado y Rotación',
    description: 'Prolonga la vida de tus neumáticos Michelin, Bridgestone o Continental.',
    category: 'Llantas',
    tools: ['Manómetro (Medidor de presión)', 'Llave de torque'],
    steps: [
      'Presión Ideal: Generalmente 32-35 PSI (revisa el marco de la puerta del piloto).',
      'Rotación: Mueve las llantas delanteras atrás cada 10,000 km para un desgaste parejo.',
      'Fecha de Caducidad: Las llantas tienen un código DOT. No uses llantas con más de 6 años.',
      'Marcas Top: Michelin (Confort), Pirelli (Agarre), Goodyear (Todoterreno).'
    ],
  ),

  // --- SECCIÓN DE FLUIDOS ---
  RepairGuide(
    title: 'Fluidos Esenciales',
    description: 'Anticongelante, Líquido de Frenos y Dirección.',
    category: 'Fluidos',
    tools: ['Trapo de microfibra', 'Líquidos específicos (DOT 4, Coolant G12)'],
    steps: [
      'Anticongelante: Cambiar cada 2 años. Nunca uses agua pura, oxida el motor.',
      'Líquido de Frenos: Cambiar cada 2 años. Absorbe humedad y pierde eficiencia.',
      'Aceite de Transmisión: Revisar nivel cada 40,000 km. Si huele a quemado, cambiar de inmediato.',
      'Dirección Hidráulica: Si el volante hace ruido al girar, revisa el nivel de fluido ATF.'
    ],
  ),
];

class CategoryListView extends StatelessWidget {
  final String categoryName;

  const CategoryListView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Filtramos las guías por la categoría que seleccionaste en el Home
    final filteredGuides = guidesMock.where((g) => g.category == categoryName).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Guías de $categoryName'),
        backgroundColor: const Color(0xFF1A237E), // Un azul oscuro más elegante
        foregroundColor: Colors.white,
      ),
      body: filteredGuides.isEmpty 
        ? const Center(child: Text('Aún no hay guías para esta categoría.'))
        : ListView.builder(
            itemCount: filteredGuides.length,
            itemBuilder: (context, index) {
              final guide = filteredGuides[index];

              return Card( // Agregamos un Card para que se vea mejor que un simple ListTile
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.build_circle, color: Colors.blue, size: 40),
                  title: Text(guide.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(guide.description),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ToolsView(guide: guide)),
                    );
                  },
                ),
              );
            },
          ),
    );
  }
}