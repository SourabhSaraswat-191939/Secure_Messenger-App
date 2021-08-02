import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) imagePickedFn;
  const UserImagePicker(this.imagePickedFn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _storedImage;

  void _pickImage(ImageSource imageSource) async {
    final pickedImageFile =
        await ImagePicker.platform.pickImage(source: imageSource);
    if (pickedImageFile == null) {
      return;
    }
    Navigator.of(context).pop();
    setState(() {
      _storedImage = File(pickedImageFile.path);
    });
    widget.imagePickedFn(_storedImage!);
  }

  Widget bottomSheet() {
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // color: Colors.amber,
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                label: Text(
                  'Camera',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
              ),
              TextButton.icon(
                label: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            backgroundImage:
                _storedImage == null ? null : FileImage(_storedImage!),
            radius: 80,
            child: Center(
              child: _storedImage != null
                  ? null
                  : Icon(
                      Icons.person,
                      size: 130,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        Positioned(
          child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: InkResponse(
                borderRadius: BorderRadius.circular(13),
                // highlightColor: Colors.green,
                // splashColor: Colors.red,
                onTap: () {
                  print("Check");
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => bottomSheet(),
                  );
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).accentColor,
                ),
              )),
          bottom: 20,
          right: 20,
        )
      ],
    ));
  }
}
