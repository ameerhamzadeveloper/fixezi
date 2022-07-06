import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../../../config/colors.dart';

class CompanyInfo extends StatefulWidget {
  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: Text("Company Info"),
        actions: [
          IconButton(
            icon: Icon(Icons.info,color: Colors.red,size: 30,),
            onPressed: (){
              showDialog(context: context, builder: (ct){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  title: Text("Fixezi Note",textAlign: TextAlign.center,),
                  content: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        Text("When you have marked a job as"),
                        Text("‘incomplete’",style: TextStyle(color: blueColor),),
                        Text("it is moved to the ‘Jobs Pending’ location.",textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: MaterialButton(
                        height: 30,
                        color:aquaColor,
                        onPressed: ()=> Navigator.pop(context),
                        child: Text("Ok",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                );
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${Utils.baseImageUrl}${pro.tradieProfile!.companyImageUrl}")
                      )
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Personal Information",style: TextStyle(color: Colors.grey),),
                  IconButton(
                    icon: const Icon(LineIcons.edit,color: Colors.white,),
                    onPressed: (){},
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.user,size: 30,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.businessName ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.user,size: 30,color: Colors.black),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.tradingName ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.user,size: 30,color: Colors.black),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.businessOwnerName ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.phone,size: 30,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.mobileNumber ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.phone,size: 30,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.officePhone ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.envelope,size: 30,color: Colors.black),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.email ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.mapMarker,size: 30,color: Colors.black),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.businessAddress ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.envelope,size: 30,color: Colors.black),
                          SizedBox(width: 10,),
                          Text(pro.tradieProfile!.email ?? "Loading...",style: GoogleFonts.poppins(color: Colors.black,fontSize: 18),)
                        ],
                      ),
                    ),
                    // Divider(color: Colors.black,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Work Information",style: TextStyle(color: Colors.grey),),
                  IconButton(
                    icon: Icon(LineIcons.edit,color: Colors.white,),
                    onPressed: (){},
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location Radius",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile == null ? "":"${pro.tradieProfile!.locationRadius} KM",style: GoogleFonts.poppins(color: pureBlueColor,fontSize: 18),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Charge Callout fee",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.calloutFee == "1" ? "Yes" : "No",style: GoogleFonts.poppins(color: pureBlueColor,fontSize: 18),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Work Emerygency Callout",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.emergencyCallout == "1" ? "Yes" : "No",style: GoogleFonts.poppins(color: pureBlueColor,fontSize: 18),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Work Type",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.workType!,style: GoogleFonts.poppins(color: pureBlueColor,fontSize: 18),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Trade",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.tradeName ?? "Loading...",style: GoogleFonts.poppins(color: pureBlueColor,fontSize: 18),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Hourly Rate",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.hourlyRate!,style: GoogleFonts.poppins(color: Colors.green),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Work on fixed Price",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.workOnFixedPrice == "1" ? "Yes":"No",style: GoogleFonts.poppins(color: Colors.green),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                      Text("Creation Date",style: TextStyle(color: Colors.black),),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(pro.tradieProfile!.addDate.toString(),style: GoogleFonts.poppins(color: Colors.green),)
                          ],
                        ),
                      ),
                      Divider(color: Colors.black,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Documents Information",style: TextStyle(color: Colors.grey,fontSize: 18),),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Contactor Licence Image",style: TextStyle(color: Colors.black),),
                          IconButton(
                            icon: Icon(LineIcons.edit,),
                            onPressed: (){},
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Center(child: Image.network("${Utils.baseImageUrl}${pro.tradieProfile!.contractorlicenceImageUrl}",height: 100,width: 100,))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Driver Licence Image",style: TextStyle(color: Colors.black),),
                          IconButton(
                            icon: Icon(LineIcons.edit,),
                            onPressed: (){},
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Center(child: Image.network("${Utils.baseImageUrl}${pro.tradieProfile!.driverLicenceImageUrl}",height: 100,width: 100,))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Company Service Images",style: TextStyle(color: Colors.black),),
                          IconButton(
                            icon: Icon(LineIcons.edit,),
                            onPressed: (){},
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Center(child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(pro.tradieProfile!.serviceImages!.length, (index) => Image.network("${Utils.baseImageUrl}${pro.tradieProfile!.serviceImages![index].companyserviceImage}",height: 100,width: 100,)),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}