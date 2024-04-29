import 'dart:typed_data';

import 'package:isar/isar.dart';
part 'ui_database.g.dart';

@collection
class ImageModel {
  Id id = Isar.autoIncrement;
  String imageId;

  List<byte> imageName;
  //String imageName;
  ImageModel({required this.imageId, required this.imageName});
}
