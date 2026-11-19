class ExperimentModel {
  final String id;
  final String title;
  final String description;
  final String labRoute;
  final List<String> tools;
  final String learningObjective;

  const ExperimentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.labRoute,
    this.tools = const [],
    this.learningObjective = '',
  });
}
