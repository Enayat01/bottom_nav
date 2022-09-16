import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key}) : super(key: key);

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600, // limiting the image size
    );

    if (imageFile == null) {
      return;
      // returning if user goes back without taking picture
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _takePicture,
      backgroundColor: const Color.fromRGBO(3, 191, 111, 1),
      child: Icon(
        Icons.qr_code_scanner_rounded,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
