import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/provider/image_picker_provider.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Picker",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5F33E1),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 250,
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              imagePickerProvider.fromCamera();
                            },
                            child: Text("Camera"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              imagePickerProvider.fromGallery();
                            },
                            child: Text("Gallery"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              imagePickerProvider.clearImage();
                            },
                            child: Text("Clear Image"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: imagePickerProvider.image == null
                      ? null
                      : DecorationImage(
                          image: FileImage(imagePickerProvider.image!),
                          fit: BoxFit.cover,
                        ),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
