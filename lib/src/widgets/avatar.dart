import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app_2/src/widgets/circle_container.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  final double size;

  const Avatar({Key key, this.size = 150}) : super(key: key);
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  File _file;
  final picker = ImagePicker();

  Future _pickImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _file = File(pickedImage.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          _file == null
              ? SvgPicture.network(
                  'https://www.flaticon.com/svg/static/icons/svg/2922/2922506.svg')
              : ClipRRect(
                  child: Image.file(
                    _file,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
          Positioned(
            //solo puede ser usado dentro de los children de un Stack, en ningun otro lugar, y sirve para organizar los hijos del stack y posicionarlos
            child: CupertinoButton(
              // color: Colors.green,
              padding: EdgeInsets.zero,
              onPressed: _pickImage,
              child: CircleContainer(
                child: Icon(Icons.edit),
                size: 50,
              ),
            ),
            right: 0,
            top: 0,
          ),
        ],
      ),
    );
  }
}
