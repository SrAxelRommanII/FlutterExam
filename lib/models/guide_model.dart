class RepairGuide {
  final String title;
  final String description; // <-- Agrega esta línea
  final String category;
  final List<String> tools;
  final List<String> steps;

  const RepairGuide({
    required this.title,
    required this.description, // <-- Agrega esta línea
    required this.category,
    required this.tools,
    required this.steps,
  });
}