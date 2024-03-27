import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  AppImagePicker();

  pick({onPick}) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      onPick(image.path.toString());
    } else {
      onPick("");
    }
  }
}
