import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/utils/utils.dart';
import 'package:fixezi/views/authentication/quick_search/job_request_sent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../provider/job_search_provider.dart';
class BookTradie extends StatefulWidget {
  final int index;
  const BookTradie({Key? key,required this.index}) : super(key: key);

  @override
  _BookTradieState createState() => _BookTradieState();
}

class _BookTradieState extends State<BookTradie> {
  var textbgColor = aquaColor;
  bool isOpenRating = false;
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<JobSearchProvider>(context);
    final proProfile = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Tradie"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(child: Text("Company Images",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                padding: const EdgeInsets.all(10),
                height: 280,
                width: getWidth(context),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(pro.tradesManList[widget.index].serviceImages!.length, (index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network("${Utils.baseImageUrl}${pro.tradesManList[widget.index].serviceImages![index].companyserviceImage}",width: getWidth(context),),
                        );
                      })
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Center(child: Text("Services Provided",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                padding: const EdgeInsets.all(10),
                height: 280,
                width: getWidth(context),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(pro.tradesManList[widget.index].serviceImages!.length, (index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network("${Utils.baseImageUrl}${pro.tradesManList[widget.index].serviceImages![index].companyserviceImage}",width: getWidth(context),),
                      );
                    })
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(child: Text("Tradesman Information",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)),
                    ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Text(pro.tradesManList[widget.index].businessName!,style: GoogleFonts.poppins(fontSize: 18),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             Text("Office Number : ",style: GoogleFonts.poppins(fontSize: 18),),
                             Text(pro.tradesManList[widget.index].officePhone!,style: GoogleFonts.poppins(fontSize: 18),)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             Text("Mobile Number : ",style: GoogleFonts.poppins(fontSize: 18),),
                             Text(pro.tradesManList[widget.index].mobileNumber!,style: GoogleFonts.poppins(fontSize: 18),)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             Text("Email : ",style: GoogleFonts.poppins(fontSize: 18),),
                             Text(pro.tradesManList[widget.index].email!,style: GoogleFonts.poppins(fontSize: 18),)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             Text("Website Url : ",style: GoogleFonts.poppins(fontSize: 18),),
                             Text(pro.tradesManList[widget.index].companyWebsiteUrl ?? "",style: GoogleFonts.poppins(fontSize: 18),)
                           ],
                         )
                       ],
                     ),
                   )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Center(child: Text("Rating's From Previous Users",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Out of 0 Users",style: GoogleFonts.poppins(fontSize: 16),),
                          SizedBox(height: 10,),
                          pro.tradesManList[widget.index].totalRating != '0'? Column(
                            children: [
                              Text("Efficiency",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text("Workmanship",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const[
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text("Price",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,size: 40,color: aquaColor,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                  Icon(LineIcons.star,size: 40,color: Colors.white,),
                                ],
                              )
                            ],
                          ):Column(
                            children: [
                              SizedBox(height: 30,),
                              Text("The tradesman has not been rated in fixezi-The app of all trades as of yet.you can off course google them, then come back, hire them and be the first to rate them",style: GoogleFonts.poppins(fontSize: 16),textAlign: TextAlign.center,),
                              SizedBox(height: 20,),
                              MaterialButton(
                                shape: StadiumBorder(),
                                color: aquaColor,
                                onPressed: (){},
                                child: Text("OK"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                ),
                child: Center(child: Text(pro.tradesManList[widget.index].workOnFixedPrice == "1" ? "I only work off fixed prices" : pro.tradesManList[widget.index].hourlyRate!,style: GoogleFonts.poppins(fontSize: 18),)),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  height: 50,
                  color: aquaColor,
                  onPressed: (){
                    showDialog(
                        context: context, builder: (c){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        content: Container(
                          height: 80,
                          child: Column(
                            children: [
                              Text("This Tradesman will be notified to consider your job request.Select accept to continue",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            onPressed: (){
                              pro.bookTradie(proProfile.userProfileData['userId'], pro.tradesManList[widget.index].tradeManId!,widget.index,context,proProfile.userProfileData);
                              Navigator.pop(context);
                              proProfile.sendPushNotification(pro.tradesManList[widget.index].tradeManId!, "You have Received New Job");
                              showDialog(context: context, builder: (c){
                                return CupertinoAlertDialog(
                                   title: Text("Please Wait"),
                                  content: CupertinoActivityIndicator(),
                                );
                              });
                            },
                            color: aquaColor,
                            child: Text("Accept",style: TextStyle(color: Colors.white),),
                            minWidth: 100,
                          ),
                          SizedBox(width: 20,),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            onPressed: ()=> Navigator.pop(context),
                            color: Colors.red,
                            child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            minWidth: 100,
                          )
                        ],
                        actionsAlignment: MainAxisAlignment.center,
                      );
                    });
                  },
                  child: Text("Book Now"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  height: 50,
                  color: Colors.red,
                  onPressed: ()=>Navigator.pop(context),
                  child: Text("Cancel",style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
