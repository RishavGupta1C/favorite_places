import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    _selectedImage = File(pickedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: _takePicture,
        icon: const Icon(Icons.camera),
        label: const Text('Take Picture'),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
    );
  }
}
