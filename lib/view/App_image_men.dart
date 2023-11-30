import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AppImagePicker_men {
  late ImageSource source;

  AppImagePicker_men({required this.source});

  pick({onpick}) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    if (image != null) {
      onpick(File(image.path));
    } else {
      onpick(null);
    }
  }
}
