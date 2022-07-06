import 'package:flutter/material.dart';
class ViewImage extends StatefulWidget {
  final String path;

  const ViewImage({Key? key,required this.path}) : super(key: key);

  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(widget.path),
      ),
    );
  }
}
