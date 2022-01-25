class transaction {
  final String id;
  final String title;
  final double cost;
  final DateTime date;

  transaction(
      {required this.id,
      required this.title,
      required this.cost,
      required this.date});
}
