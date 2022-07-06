import 'dart:io';
import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../provider/signup_provider.dart';
import '../../provider/tradie_jobs.dart';

class AddQuoteJob extends StatefulWidget {
  final int index;

  const AddQuoteJob({Key? key,required this.index}) : super(key: key);
  @override
  _AddQuoteJobState createState() => _AddQuoteJobState();
}

class _AddQuoteJobState extends State<AddQuoteJob> {

  String des = '';
  String price = '';
  String incGst = '';
  // String des = '';
  bool is7Selected = false;
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Quote"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info,color: Colors.red,size: 30,),
            onPressed: (){
              showDialog(context: context, builder: (ct){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  title: const Text("Fixezi Note",textAlign: TextAlign.center,),
                  content: SizedBox(
                    height: 120,
                    child: Column(
                      children: const [
                        Text("When you give the client an additional Quote, the Job will have an additional /1 after the number, the /1 will be added from the Job you had open to perform the ‘Add quote’ function."),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: MaterialButton(
                        height: 30,
                        color:aquaColor,
                        onPressed: ()=> Navigator.pop(context),
                        child: const Text("Ok",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                );
              });
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(pro.quotesImageList.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                              image: FileImage(File(pro.quotesImageList[index]))
                            )
                          ),
                        ),
                      );
                    }),
                  ),
                  InkWell(
                    onTap:(){
                      showCupertinoModalPopup(context: context, builder: (c){
                        return CupertinoActionSheet(
                          cancelButton: CupertinoDialogAction(child:const Text("Cancel",style: TextStyle(color: Colors.red),),onPressed: ()=> Navigator.pop(context),),
                          actions: [
                            CupertinoDialogAction(child:const Text("Camera"),onPressed: (){
                              pro.getImageForQuotes(1);
                              Navigator.pop(context);
                            },),
                            CupertinoDialogAction(child:const Text("Gallery"),onPressed: (){
                              pro.getImageForQuotes(2);
                              Navigator.pop(context);
                            },),
                          ],
                        );
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        // border: Border.all(),
                      ),
                      child: Image.asset(AssetsConfig.cameraIcon,fit: BoxFit.cover,),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("How long will this quote last ?",style: TextStyle(color: Colors.black,fontSize: 22),),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: 130,
                  height: 40,
                  color: is7Selected ? aquaColor : Colors.grey,
                  onPressed: (){
                    setState(() {
                      is7Selected = true;
                    });
                  },
                  child: const Text("7 Days",style: TextStyle(fontSize: 20),),
                ),
                MaterialButton(
                  minWidth: 130,
                  height: 40,
                  color: is7Selected ? Colors.grey:aquaColor,
                  onPressed: (){
                    setState(() {
                      is7Selected = false;
                    });
                  },
                  child: const Text("14 Days",style: TextStyle(fontSize: 20),),
                )
              ],
            ),
            const SizedBox(height: 70,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                  borderRadius:BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Job no : ",style: const TextStyle(color: Colors.black),),
                      Text("${pro.allJobs![widget.index].jobId}/1",style: TextStyle(color: Colors.red),)
                    ],
                  ),
                   TextField(
                    maxLines: 12,
                    decoration: InputDecoration(
                      hintText: "Quote Description : ",
                      border: InputBorder.none
                    ),
                    onChanged: (v){
                      des = v;
                    },
                  ),
                  Row(
                    children: [
                      Text("Price inc Gst",style: TextStyle(color: Colors.black),),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          // maxLines: 6,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "",
                              prefix: Text("\$")
                              // border: InputBorder.none
                          ),
                          onChanged: (v){
                            price = v;
                          },
                        ),
                      ),
                      // Text("Gst ",style: TextStyle(color: Colors.black),),
                      // Expanded(
                      //   child: TextField(
                      //     keyboardType: TextInputType.number,
                      //     // maxLines: 6,
                      //     decoration: InputDecoration(
                      //         hintText: "",
                      //         prefix: Text("\$")
                      //     ),
                      //     onChanged: (v){
                      //       incGst = v;
                      //     },
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            // Spacer(),

            const SizedBox(height: 20,),
          ],
        ),
      ),
      bottomNavigationBar:  pro.isLoading ? Center(
        child: CircularProgressIndicator(),
      ):Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixeziButton(title: "Save and send Quote to client", color: aquaColor, onTap: (){
          pro.addJobQuote(des, price, incGst, is7Selected ? '7':'14', context);
        }, textColor: Colors.white),
      ),
    );
  }
}
