import 'package:flutter/material.dart';

 getHeight(BuildContext context)=> MediaQuery.of(context).size.height;
 getWidth(BuildContext context)=> MediaQuery.of(context).size.width;
void nextScreen(context, page) {
 Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
void nextReplacementScreen(context, page) {
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}