import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class CaloriesViewModel extends ChangeNotifier {
  Uint8List? selectedImage;
  String imageUrl = '';

  Uint8List? get _selectedImage => selectedImage;

  Future<void> pickImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      selectedImage = imageBytes;
      notifyListeners();
    }
  }
}
