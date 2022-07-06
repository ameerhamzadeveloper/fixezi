import 'dart:io';

import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tradie_jobs.dart';
class JobNotePreview extends StatefulWidget {
  @override
  _JobNotePreviewState createState() => _JobNotePreviewState();
}

class _JobNotePreviewState extends State<JobNotePreview> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: getHeight(context) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(File(pro.jobNoteImage))
                )
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.red,
                  onPressed: ()=> Navigator.pop(context) ,
                  child: Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
                MaterialButton(
                  color: aquaColor,
                  onPressed: (){
                    pro.addJobNote(authPro.userId);
                    Navigator.pop(context);
                  },
                  child: Text("Add Image",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
