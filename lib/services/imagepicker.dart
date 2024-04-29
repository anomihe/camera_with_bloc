import 'package:image_picker/image_picker.dart';

class ImagePickerClass {
  static Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    //var picked=  await image.readAsString();
    return image;
  }
}
