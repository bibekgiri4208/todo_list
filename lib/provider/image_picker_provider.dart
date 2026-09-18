import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();
  File? _image;
  File? get image => _image;

  Future<void> fromGallery() async {
    final pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage == null) {
      return;
    }

    _image = File(pickedImage.path);
    notifyListeners();
  }

  Future<void> fromCamera() async {
    final pickedImage = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage == null) {
      return;
    }
    _image = File(pickedImage.path);
    notifyListeners();
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }
}
