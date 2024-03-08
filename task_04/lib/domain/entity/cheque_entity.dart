import 'package:surf_flutter_courses_template/data/mock_data.dart';

class ChequeEntity {
  final int id;
  final DateTime date;
  final List products;

  ChequeEntity({required this.id, required this.date, required this.products});
}

/// Получить чек по номеру
Future<ChequeEntity> getCheque({required int id}) {
  return Future.value(ChequeEntity(
      id: id, date: DateTime(2024, 2, 23, 12, 23), products: productList));
}
