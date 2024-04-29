import 'package:camera_app/database/ui_database.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class DatabaseHelper {
  late Future<Isar> _db;

  DatabaseHelper() {
    _db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ImageModelSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<ImageModel>> loadImage() async {
    final Isar dbInst = await _db;
    final images = await dbInst.imageModels.where().sortByImageId().findAll();
    return images;
  }

  Future<void> createImage( List<int> imageName) async {
    final Isar dbInst = await _db;
    const uuid = Uuid();
    final image = ImageModel(imageId: uuid.v4(), imageName: imageName);
    await dbInst.writeTxn(() async {
      await dbInst.imageModels.put(image);
    });
  }

  Future<void> deleteImage(String id) async {
    final Isar dbInst = await _db;
    final ImageModel? imageModel =
        await dbInst.imageModels.filter().imageIdEqualTo(id).findFirst();
    if (imageModel != null) {
      await dbInst.writeTxn(() async {
        await dbInst.imageModels.delete(imageModel.id);
      });
    }
  }
}
