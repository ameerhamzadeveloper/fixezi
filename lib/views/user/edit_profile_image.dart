import 'dart:io';

import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
class EditProfileImageUSer extends StatefulWidget {
  @override
  _EditProfileImageUSerState createState() => _EditProfileImageUSerState();
}

class _EditProfileImageUSerState extends State<EditProfileImageUSer> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: aquaColor,width: 10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(pro.userProfileImage)
                  )
                )
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                pro.cropImage();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300]
                ),
                width: 150,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(LineIcons.crop),
                    Text("Crop Image",style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
            ),
            Spacer(),
            FixeziButton(title: "Cancel", color: Colors.red, onTap: (){
              Navigator.pop(context);
              pro.makeUserProfileNull();
            }, textColor: Colors.white),
            SizedBox(height: 10,),
            FixeziButton(title: "Save", color: aquaColor, onTap: (){
              Navigator.pop(context);
            }, textColor: Colors.white),
            SizedBox(height: 50,)
            // Image.file(File(pro.userProfileImage))
          ],
        ),
      ),
    );
  }
}
