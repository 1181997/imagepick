import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final ImagePicker _picker = ImagePicker();

  String imagepath="";
  List<XFile>? imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Column(
        children: [
          GridTile(
            child: Container(
              height: 200,
              width: 200,
              child: imagepath.isEmpty
              ? Icon(Icons.supervised_user_circle) :Image.file(File(imagepath)),
            ),
          ),
          OutlinedButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return SimpleDialog(
                title: Text("Select Picture"),
                children: [
                  ListTile(
                    leading: Text("Camera"),
                    onTap: () async {
                      Navigator.pop(context);
                      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                      if(photo!=null)
                        {
                          imagepath=photo.path;
                          setState(() {

                          });
                        }
                    },
                  ),
                  ListTile(
                    leading: Text("Galary"),
                    onTap: () async {
                      Navigator.pop(context);
                      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                      //final List<XFile>? photo = await _picker.pickMultiImage();
                      if(imageFileList!=null)
                      {
                       imagepath=photo!.path;
                       //imageFileList!.addAll(Iterable.empty());
                        setState(() {

                        });
                      }
                    },
                  )
              // List<XFile>? imageFileList = [];
              //
              // void selectImages() async {
              // final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
              // if (selectedImages!.isNotEmpty) {
              // imageFileList!.addAll(selectedImages);
              // }
              // setState(() {
              // });
              // }

                ],
              );
            },);
          }, child: Text("Choose File"))
        ],
      ),
    );
  }
}
