import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../helper/profile_class.dart';
import '../register_screen/register_screen_view_model.dart';

class ProfileViewModel extends ChangeNotifier{
  Uint8List? selectedImage;
  String imageUrl = '';

  Uint8List? get _selectedImage => selectedImage;

  Future<void> pickImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      selectedImage = imageBytes;
      notifyListeners();
    }
  }

  // Future<void> uploadImage(BuildContext context) async {
  //   if (selectedImage != null) {
  //     _imageUrl = await StoreDate().uploadImageToStorage(
  //       Provider.of<RegisterViewModel>(context, listen: false).nameController.text,
  //       selectedImage!,
  //       context,
  //     );
  //   }
  // }

}
