import 'package:fixezi/config/colors.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';
class PreviewImage extends StatefulWidget {
  final String path;
  final int index;
  const PreviewImage({Key? key,required this.path,required this.index}) : super(key: key);

  @override
  _PreviewImageState createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.file(File(widget.path)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FixeziButton(title: "Delete Image",color: aquaColor,textColor: Colors.white,onTap: (){
                pro.deleteServiceImage(widget.index);
                Navigator.pop(context);
              }),
            ),
          )
        ],
      ),
    );
  }
}
