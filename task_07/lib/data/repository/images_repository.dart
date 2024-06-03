import 'package:surf_flutter_courses_template/data/mock_data.dart';
import 'package:surf_flutter_courses_template/domain/entity/image.dart';

Future <List<Image>> getData() {
  return Future.delayed((const Duration(seconds: 5)),() => images);
}
