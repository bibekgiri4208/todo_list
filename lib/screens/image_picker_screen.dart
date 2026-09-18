import 'package:flutter/material.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            onPressed: () {},
                            child: Text("Camera"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Gallery"),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
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
