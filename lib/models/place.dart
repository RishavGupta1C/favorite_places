import 'package:uuid/uuid.dart';

// UNIQUE ID
const uuid = Uuid();

class Place {
  final String id;
  final String title;

  Place({required this.title}) : id = uuid.v4();
}
