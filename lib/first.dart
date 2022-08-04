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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: imagepath.isEmpty
            ? Icon(Icons.supervised_user_circle) :Image.file(File(imagepath)),
          ),
          OutlinedButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return SimpleDialog(
                title: Text("Select Picture"),
                children: [
                  ListTile(
                    leading: Text("Camera"),
                    onTap: () async {
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
                      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                      if(photo!=null)
                      {
                        imagepath=photo.path;
                        setState(() {

                        });
                      }
                    },
                  )
                ],
              );
            },);
          }, child: Text("Choose File"))
        ],
      ),
    );
  }
}