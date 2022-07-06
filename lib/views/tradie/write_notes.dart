import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/tradie_jobs.dart';
import '../../config/colors.dart';
class WritingNotes extends StatefulWidget {
  @override
  _WritingNotesState createState() => _WritingNotesState();
}

class _WritingNotesState extends State<WritingNotes> {
  GlobalKey<FormState> keyye= GlobalKey<FormState>();
  String note = '';
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: keyye,
          child: Column(
            children: [
              Container(
                height: getHeight(context) / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  maxLines: 13,
                  decoration: InputDecoration(
                    hintText: "Add Note",
                    border: InputBorder.none
                  ),
                  onChanged: (v){
                    note = v;
                  },
                  validator: (c){
                    if(c!.isEmpty){
                      return "Note Can't Be Empty";
                    }else{
                      return null;
                    }
                  },
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
                      if(keyye.currentState!.validate()){
                        Navigator.pop(context);
                        pro.addWritingNotes(note,authPro.userId);
                      }
                    },
                    child: Text("Add Note",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
