class Drug {
  final String drugId;
  final String name;
  final String description;
  final bool continuous = false;
  final DateTime date;

  Drug({
    required this.drugId,
    required this.name,
    required this.description,
    required this.date,
  });
}
