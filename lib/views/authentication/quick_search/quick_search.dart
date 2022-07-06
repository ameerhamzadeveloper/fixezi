import 'package:dropdown_search/dropdown_search.dart';
import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/job_search_provider.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/quick_search/address.dart';
import 'package:fixezi/views/authentication/quick_search/another_address.dart';
import 'package:fixezi/views/authentication/quick_search/select_trademan.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../splash.dart';
import '../../user/previous_history.dart';
import '../../user/settings.dart';
import '../../user/your_invoice.dart';
class QuickSearch extends StatefulWidget {
  final bool isFromBottom;
  const QuickSearch({Key? key,required this.isFromBottom}) : super(key: key);

  @override
  _QuickSearchState createState() => _QuickSearchState();
}

class _QuickSearchState extends State<QuickSearch> {
  bool isCommercial = true;
  bool isOWnAddressSelect = false;
  bool isAnotherAddressSelect = false;
  String tradeId = '0';
  String erro = '';
  String search = '';

  @override
  void initState() {
    super.initState();
    final pro = Provider.of<JobSearchProvider>(context,listen: false);
    pro.getLocation();
    pro.fetchTrade();
  }
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat('dd MMM yyyy');
    final pro = Provider.of<JobSearchProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      drawer:Drawer(
        child: Column(
          children: [
            // SizedBox(height: 40,),
            Container(
              width: double.infinity,
              color: greyBgColor,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: btnLightBlueColor,
                      //     spreadRadius: 2,
                      //     blurRadius: 6,
                      //     offset: Offset(0, 4),
                      //   ),
                      // ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetsConfig.logo)
                        )
                    ),
                  ),
                  Text("Fixezi",style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("The App Of All Trades",style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            ListTile(
              onTap: ()=>Navigator.pop(context),
              leading: Icon(LineIcons.user),
              title: Text("Your Info",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, UserYourInvoice()),
              leading: Icon(LineIcons.fileInvoice),
              title: Text("Your Invoice",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, UserPreviousHistory()),
              leading: Icon(LineIcons.history),
              title: Text("Previous History",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Share.share("This is Fixezi");
              },
              leading: Icon(LineIcons.share),
              title: Text("Share",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, USerSettings()),
              leading: Icon(LineIcons.cog),
              title: Text("Settings",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Are you sure to logout?"),
                    actions: [
                      TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel")),
                      TextButton(onPressed: (){
                        authPro.clearSharedData();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
                      }, child: Text("Logout",style: TextStyle(color: Colors.red),)),
                    ],
                  );
                });
              },
              leading: Icon(LineIcons.alternateSignOut),
              title: Text("Logout",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(LineIcons.bars),
            onPressed: (){
              if(authPro.userId == ''){
                showDialog(context: context, builder: (c){
                  return CupertinoAlertDialog(
                    title: const Text("Please Sign in/up for access"),
                    actions: [
                      CupertinoDialogAction(child: const Text("Ok"),onPressed: ()=> Navigator.pop(context),)
                    ],
                  );
                });
              }else{
                _scaffoldKey.currentState!.openEndDrawer();
              }
            },
          ),
          title: const Text("Job Requirements"),
          actions: [
            IconButton(
              icon: const Icon(Icons.info,color: Colors.red,),
              onPressed: (){
                showDialog(context: context, builder: (ct){
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: const Text("Fixezi Note",textAlign: TextAlign.center,),
                    content: const Text("Please select the requirements for your job and on the next screen you can select a company to fix your Job.If you wish to get several quotes, book one company on the next screen and then come back here to select a different Time/Date for a second company and repeat the process, maximum 3 trades for quotes.",textAlign: TextAlign.center,),
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
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        color: Colors.white,
                        onPressed: (){
                          pro.setResidentialVal(true);
                        },
                        child: Text("Residential",style: TextStyle(fontSize: 20,color:pro.isResidential ? aquaColor : Colors.black,),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Colors.white,
                        onPressed: (){
                          pro.setResidentialVal(false);
                        },
                        child: Text("Commercial",style: TextStyle(fontSize: 20,color: !pro.isResidential ? aquaColor : Colors.black),),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      isScrollControlled: true,
                        context: context, builder: (c){
                      return SafeArea(
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(height: 50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.clear,color: Colors.black,))
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all()
                                ),
                                child: TextField(
                                  onChanged: (v){
                                    setState(() {
                                      search = v;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Search Trade",
                                    border: InputBorder.none
                                  ),
                                ),
                                padding: const EdgeInsets.only(left:12),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (c,i){
                                    if(search != ''){
                                      if(pro.tradeList[i].tradeName.contains(search.toUpperCase())){
                                        return InkWell(
                                          onTap: (){
                                            tradeId = pro.tradeList[i].tradeId;
                                            pro.fetchProblemByTrade(pro.tradeList[i].tradeId,pro.tradeList[i].tradeName);
                                            print(pro.tradeList[i].tradeId);
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(pro.tradeList[i].tradeName,style: TextStyle(fontSize: 18),),
                                          ),
                                        );
                                      }else{
                                        return Container();
                                      }
                                    }else{
                                      return InkWell(
                                        onTap: (){
                                          tradeId = pro.tradeList[i].tradeId;
                                          pro.fetchProblemByTrade(pro.tradeList[i].tradeId,pro.tradeList[i].tradeName);
                                          print(pro.tradeList[i].tradeId);
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(pro.tradeList[i].tradeName,style: TextStyle(fontSize: 18),),
                                        ),
                                      );
                                    }
                                  },
                                  itemCount: pro.tradeList.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                      child: Text(pro.selectTrade == ''? "Select Trade": pro.selectTrade,style: GoogleFonts.poppins(fontSize: 20,color: Colors.black),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        isScrollControlled: true,
                        context: context, builder: (c){
                      return SafeArea(
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(height: 50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.clear,color: Colors.black,))
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all()
                                ),
                                child: TextField(
                                  onChanged: (v){
                                    setState(() {
                                      search = v;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Search Problem",
                                      border: InputBorder.none
                                  ),
                                ),
                                padding: const EdgeInsets.only(left:12),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (c,i){
                                    if(search != ''){
                                      if(pro.problemList[i].problemName.contains(search.toUpperCase())){
                                        return InkWell(
                                          onTap: (){
                                            pro.setProblemId(pro.problemList[i].problemId);
                                            pro.setProblemVal(pro.problemList[i].problemName);
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(pro.problemList[i].problemName,style: TextStyle(fontSize: 18),),
                                          ),
                                        );
                                      }else{
                                        return Container();
                                      }
                                    }else{
                                      return InkWell(
                                        onTap: (){
                                          pro.setProblemId(pro.problemList[i].problemId);
                                          pro.setProblemVal(pro.problemList[i].problemName);
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(pro.problemList[i].problemName,style: TextStyle(fontSize: 18),),
                                        ),
                                      );
                                    }
                                  },
                                  itemCount: pro.problemList.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                      child: Text(pro.selectProblem == ''? "Select Problem": pro.selectProblem,style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    pro.selectDate(context);
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pro.date == DateTime.now() ? "Select Date" : "Date : ${format.format(pro.date)}",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,),),
                          // IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_outlined))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    pro.selectTime(context);
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pro.time == TimeOfDay.now() ? "Select Time" : "Time : ${pro.time.format(context)}",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,),),
                          // IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_outlined))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: btnBlueColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Center(child: Text("Find a tradie for",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,),)),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          pro.setIsAnotherAddress(false);
                          if(widget.isFromBottom){
                            setState(() {
                              isOWnAddressSelect = true;
                              isAnotherAddressSelect = false;
                            });
                          }else{
                            nextScreen(context, JobAddress());
                            setState(() {
                              isOWnAddressSelect = true;
                              isAnotherAddressSelect = false;
                            });
                          }
                        },
                        child: Container(
                          // height: 0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isOWnAddressSelect == true ? aquaColor: Colors.white
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Center(child: Text("Your own\nAddress",style: TextStyle(fontSize: 20,color: Colors.black,),textAlign: TextAlign.center,)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          pro.setIsAnotherAddress(true);
                          nextScreen(context, AnotherAddressJob());
                          setState(() {
                            isOWnAddressSelect = false;
                            isAnotherAddressSelect = true;
                          });
                        },
                        child: Container(
                          // height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isAnotherAddressSelect == true ? aquaColor: Colors.white
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Center(child: Text("Another\nAddress",style: TextStyle(fontSize: 20,color: Colors.black,),textAlign: TextAlign.center,)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: btnBlueColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Center(child: Text("Do you have any other requests",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,),)),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  // height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Do you have a problem not listed or something else you would like to ask the tradie ? "
                      ),
                    )
                  ),
                ),
                Text(erro,style: TextStyle(color: Colors.red),),
                const SizedBox(height: 30,),
                FixeziButton(title: "Find Tradie", color:pro.selectTrade != '' || pro.selectProblem != '' || pro.lat != '' ? aquaColor : Colors.grey, onTap: (){
                  setState(() {
                    erro = "";
                  });
                  if(pro.selectTrade != '' || pro.selectProblem != '' || pro.lat != ''){
                    pro.searchJob(context);
                    Future.delayed(const Duration(seconds: 1),(){
                      nextScreen(context, SelectTrademan());
                    });
                  }else{
                    setState(() {
                      erro = "Please select fields above";
                    });
                  }
                }, textColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
