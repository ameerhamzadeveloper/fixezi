import 'dart:io';

import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/utils/utils.dart';
import 'package:fixezi/views/tradie/preview_notes.dart';
import 'package:fixezi/views/tradie/write_notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/signup_provider.dart';
class AddJobNotes extends StatefulWidget {
  final int index;

  const AddJobNotes({Key? key,required this.index}) : super(key: key);
  @override
  _AddJobNotesState createState() => _AddJobNotesState();
}

class _AddJobNotesState extends State<AddJobNotes> {
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    pro.fetchJobNoteImages();
    pro.fetchJobNoteText();
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Notes/Images"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Add Image",style: TextStyle(fontSize: 20),),
                  IconButton(onPressed: (){
                    showCupertinoModalPopup(context: context, builder: (c){
                      return CupertinoActionSheet(
                        cancelButton: CupertinoDialogAction(child:const Text("Cancel",style: TextStyle(color: Colors.red),),onPressed: ()=> Navigator.pop(context),),
                        actions: [
                          CupertinoDialogAction(child:const Text("Camera"),onPressed: (){
                            pro.getImage(1,context);
                            Navigator.pop(context);
                          },),
                          CupertinoDialogAction(child:const Text("Gallery"),onPressed: (){
                            pro.getImage(2,context);
                            Navigator.pop(context);
                          },),
                        ],
                      );
                    });
                  }, icon: Icon(Icons.add,color: Colors.white,size: 30,))
                ],
              ),
              pro.jobNotesImageList.isEmpty ? Center(
                child: Text("No Notes"),
              ):GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: pro.jobNotesImageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: (){
                        nextScreen(context, PreviewNotes(url: index));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${Utils.baseImageUrl}${pro.jobNotesImageList[index].jobNoteImageUrl}")
                          )
                        ),
                      ),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Notes",style: TextStyle(fontSize: 20),),
                  IconButton(onPressed: (){
                    nextScreen(context,WritingNotes());
                  }, icon: Icon(Icons.add,color: Colors.white,size: 30,))
                ],
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: pro.jobNotesList.length,
                itemBuilder: (c,i){
                  return Card(
                    child: ListTile(
                      title: Text(pro.jobNotesList[i].jobNoteText!),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
