import 'dart:convert';

import 'package:fixezi/constants.dart';
import 'package:fixezi/model/fetch_card_model.dart';
import 'package:fixezi/model/fetch_current_plan_model.dart';
import 'package:fixezi/model/fetch_employe_job_tradie.dart';
import 'package:fixezi/model/fetch_employee_model.dart';
import 'package:fixezi/model/fetch_invoice_model.dart';
import 'package:fixezi/model/fetch_job_note_image.dart';
import 'package:fixezi/model/fetch_job_note_text.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/services/api_service.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:fixezi/views/splash.dart';
import 'package:fixezi/views/tradie/job_note_preview.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../model/fetch_job_model.dart';

class TradieJobsProvider extends ChangeNotifier{
  
  List<JobModel>? jobRequest;
  List<JobModel>? allJobs;
  List<JobModel>? pendingJobs;
  List<JobModel>? completedJobs;
  List<EmployeJobTradieModel>? employeJobsTradie;
  List<FetchCard> cards = [];
  String currentTradiePlan = '';
  bool isPaid = false;
  int selectedJobIndex = 0;
  String accountStatus = '';

  String jobNoteImage = '';
  String jobSolution = '';
  String material = '';
  String labour = '';
  String tradePersons = '';
  String jobPrice = '';
  String incGst = '';
  bool isAccountHold = false;
  CurrentPlanModel? currentPlan;

  String currentAllJobSelectedID = '';
  String jobHourTime = '0';


  setAllJobCurrentId(String jobIddd){
    currentAllJobSelectedID = jobIddd;
  }

  addValue(int offset,String val){
    switch(offset){
      case 1:
        jobSolution = val;
        break;
      case 2:
        material = val;
        break;
      case 3:
        labour = val;
        break;
      case 4:
        tradePersons = val;
        break;
      case 5:
        jobPrice = val;
        break;
      case 6:
        incGst = val;
        break;
    }
    notifyListeners();
  }


  List<String> jobNotes = [];
  List<String> jobWritingNotes = [];
  List<JobNoteText> jobNotesList = [];
  List<JobNoteImage> jobNotesImageList = [];
  List<String> quotesImageList = [];

  
  final apiService = ApiService();



  getImageForQuotes(int source)async{
    XFile? image = await ImagePicker().pickImage(source: source == 1 ? ImageSource.camera:ImageSource.gallery);
    quotesImageList.add(image!.path);
    notifyListeners();
  }
  addJobNote(String userId){
    // jobNotes.add(jobNoteImage);
    Map<String,dynamic> body = {
      'jobId':currentAllJobSelectedID,
      'userId':userId
    };
    apiService.addJobImage(body, Urls.addJobNoteImageURl, jobNoteImage).then((response){
      print(response.body);
      fetchJobNoteImages();
    });
    notifyListeners();
  }

  fetchJobNoteImages(){
    apiService.callPostApi({'jobId':currentAllJobSelectedID}, Urls.fetchJobNoteImageURl).then((response){
      print(response.body);
      var data = fetchJobNoteImageFromJson(response.body);
      jobNotesImageList = data.data;
      notifyListeners();
    });
  }
  fetchJobNoteText(){
    apiService.callPostApi({'jobId':currentAllJobSelectedID}, Urls.fetchJobNoteTExtURl).then((response){
      print(response.body);
      var data = fetchJobNoteTextFromJson(response.body);
      jobNotesList = data.data;
      notifyListeners();
    });
  }
  addWritingNotes(String note,String userID){
    // jobWritingNotes.add(note);
    Map<String,dynamic> body = {
      'jobId': currentAllJobSelectedID,
      'userId': userID,
      'jobNoteText': note,
    };
    apiService.callPostApi(body, Urls.addJobNoteTextUrl).then((value){
      fetchJobNoteText();
    });
    notifyListeners();
  }


  getImage(int source,BuildContext context)async{
    XFile? image = await ImagePicker().pickImage(source: source == 1 ? ImageSource.camera:ImageSource.gallery);
    jobNoteImage = image!.path;
    nextScreen(context, JobNotePreview());
    notifyListeners();
  }

  setJobIndex(int index){
    selectedJobIndex = index;
    notifyListeners();
  }

  selectCard(int index){
    for(var i in cards){
      i.isSelected = false;
    }
    cards[index].isSelected = true;
    notifyListeners();
  }

  fetchJobs(String userId,String status,String uri,int offset){
    allJobs = [];
    notifyListeners();
    Map<String,dynamic> body = {
      'tradeManId': userId,
      'status': status,
    };
    apiService.callPostApi(body, uri).then((response){
      var data = fetchJobModelFromJson(response.body);
      if(offset == 1){
        pendingJobs = data.data;
      }else if(offset == 2){
        allJobs = data.data;
      }else if(offset == 4){
        completedJobs = data.data;
      }
      notifyListeners();
      print(response.body);
    });
  }

  fetchEmployeeJobsTradie(String userId){
    employeJobsTradie = [];
    notifyListeners();
    Map<String,dynamic> body = {
      'tradeManId': userId,
    };
    apiService.callPostApi(body, Urls.fetchEmployeJobsTradieUrl).then((response){
      print("employeee jobs${response.body}");
      var data = fetchEmployeJobTradieModelFromJson(response.body);
       employeJobsTradie = data.data;
      notifyListeners();
      print(response.body);
    });
  }

  fetchEmployeeJobs(String userId,String status,String uri,int offset){
    allJobs = [];
    jobRequest = [];
    pendingJobs = [];
    notifyListeners();
    Map<String,dynamic> body = {
      'employId': userId,
      'status': status,
    };
    apiService.callPostApi(body, uri).then((response){
      var data = fetchJobModelFromJson(response.body);
      if(offset == 1){
        pendingJobs = data.data;
      }else if(offset == 2){
        allJobs = data.data;
      }else if(offset == 3){
        print("callled 3 ${data.data}");
        jobRequest = data.data;
      }else if(offset == 4){
        completedJobs = data.data;
      }
      notifyListeners();
      print(response.body);
    });
  }

  fetchJobsRequest(String userId){
    Map<String,dynamic> body = {
      'tradeManId': userId,
      'status': '3',
    };
    apiService.callPostApi(body, Urls.fetchJobUrl).then((response){
      print(response.body);
      var de = json.decode(response.body);
      if(de['message'] == 'Data not available '){
        jobRequest = null;
      }else{
        var data = fetchJobModelFromJson(response.body);
        jobRequest = data.data;
      }
      notifyListeners();
    });
  }

  choosePlan(String planId,String userId,String token){
    Map<String,dynamic> body = {
      'planId': planId,
      'tradeManId': userId,
      'startDate': DateTime.now().toString(),
      'endDate': DateTime.now().toString(),
    };
    apiService.callPostApi(body, Urls.ChosePlanUrl).then((response){
      print(response.body);
      // currentTradiePlan = "Basic Pay Per Job";
      notifyListeners();
      fetchCurrentPlan(userId, token);
    });
  }
  DateTime dd = DateTime.now();

  acceptEmployeJob(String jobId,String userId){
    Map<String,dynamic> body = {
      'jobId': jobId,
    };
    apiService.callPostApi(body, Urls.acceptEmployeJobUrl).then((response){
      print(response.body);
      fetchEmployeeJobs(userId, '2', Urls.fetchJobEmployeUrl, 2);
      fetchEmployeeJobs(userId, '3', Urls.fetchJobEmployeUrl, 3);
      notifyListeners();
    });
  }
  chooseMonthlyPlan(String planId,String userId,String token){
    Map<String,dynamic> body = {
      'planId': planId,
      'tradeManId': userId,
      'startDate': DateTime.now().toString(),
      'endDate':planId == '3' ? DateTime(dd.year,dd.month +1,dd.day).toString(): planId == '4' ? DateTime(dd.year,dd.month +2,dd.day).toString() : DateTime(dd.year,dd.month +4,dd.day).toString(),
    };
    apiService.callPostApi(body, Urls.ChosePlanUrl).then((response){
      print(response.body);
      // currentTradiePlan = "Basic Pay Per Job";
      fetchCurrentPlan(userId, token);
      notifyListeners();
    });
  }
  fetchCurrentPlan(String userId,String token){
    apiService.callPostApi({'tradeManId':userId}, Urls.fetchCurrentPlanUrl,headerr: {'userId':userId,'token':token}).then((response){
      var de = json.decode(response.body);
      print(de);
      if(de['message'] == "Data not available "){
        currentPlan = null;
      }else{
        var data = fetchCurrentPlanModelFromJson(response.body);
        currentPlan = data.data;
      }
      notifyListeners();
    });
  }

  fetchTradiePlan(String userId){
    Map<String,dynamic> body = {
      'tradeManId':userId,
    };
    apiService.callPostApi(body, Urls.fetchTradiePlanUrl).then((response){
      var d = json.decode(response.body);
      if(d['message'] == 'Data not available '){

      }
    });
  }

  addCard(Map<String,dynamic> map,token){
    apiService.callPostApi(map, Urls.addCardURl,headerr: {'userId':map['userId'],'token':token}).then((response){
      print(response.body);
    });
    fetchCards(map['userId'],token);
  }

  fetchCards(String userId,token){
    apiService.callPostApi({'userId':userId}, Urls.fetchCardUrl,headerr: {'userId':userId,'token':token}).then((response){
      print(response.body);
      var da = fetchCardModelFromJson(response.body);
      cards = da.data;
      notifyListeners();
    });
  }

  acceptJob(String userId,BuildContext context){
    changeJobStatus('2', 'ACCEPTED');
    fetchJobs(userId, '2', Urls.fetchJobUrl, 2);
    fetchJobs(userId, '3', Urls.fetchJobUrl, 3);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom(index: 1,)), (route) => false);
    // apiService.callPostApi({'jobRequestId':jobRequest![selectedJobIndex].jobRequestId}, Urls.acceptJobRequestUrl).then((response){
    //   print(response.body);
    //   var de = json.decode(response.body);
    //   if(de['message'] == 'Data has been saved successfully'){
    //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom(index: 1,)), (route) => false);
    //   }
    //   fetchJobsRequest(userId);
    // });
    // apiService.callPostApi({'status':'2','statusText':'ACCEPTED','jobId':jobRequest![selectedJobIndex].jobRequestId}, Urls.changeJobStatusUrl).then((response){
    //    print("job status change ${response.body}");
    //    // fetchJobsRequest(userId);
    // });

  }

  changeJobStatus(String status,String statusText){
    apiService.callPostApi({'status':status,'statusText':statusText,'jobId':currentAllJobSelectedID}, Urls.changeJobStatusUrl).then((response){
      print("job status change ${response.body}");
    });
  }

  DateTime d = DateTime.now();
  DateTime date = DateTime.now();
  Future<void> changeJobDate(BuildContext context,int index,String jobId) async {
    final DateTime? newDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        context: context,
        firstDate: DateTime(d.year,d.month - 1,d.day - 2),
        initialDate: allJobs![index].addDate!,
        lastDate: DateTime(d.year + 15,d.month,d.day)
    );

    if (newDate != null && newDate != date) {
      date = newDate;
      allJobs![index].addDate = newDate;
      changeJobTime(context,jobId);
    }
    notifyListeners();
  }
  TimeOfDay time = TimeOfDay.now();
  Future<void> changeJobTime(BuildContext context,String jobId) async {
    final TimeOfDay? newTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null && newTime != time) {
      time = newTime;
      print(date);
      apiService.callPostApi({'jobId':jobId ,'jobDateTime': date.toString(),'jobStartTime':time.format(context).toString(),}, Urls.changeJobTimeDateUrl).then((response){
        print(response.body);
        fetchJobs('LreOqa1mDQ', '2', Urls.fetchJobUrl, 2);
      });
    }
    notifyListeners();
  }

  addJobHourTime(){
    Map<String,dynamic> body = {

    };
    apiService.callPostApi(body, Urls.addJobTimeUrl).then((response){

    });
  }

  fetchJobHourTime(){
    Map<String,dynamic> body = {

    };
    apiService.callPostApi(body, Urls.fetchJobTimeUrl).then((response){

    });
  }

  bool isLoading = false;

  setIsLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }

  addJobQuote(String des,String price,String incGst,String days,BuildContext context){
    setIsLoading();
    Map<String,dynamic> body = {
      'jobQuoteDescription': des,
      'price': price,
      'jobId': currentAllJobSelectedID,
      'days': days,
      'incgst':incGst,
    };
    apiService.addJobQuote(body, Urls.addJobQuoteUrl, quotesImageList).then((response){
      setIsLoading();
      print(response.body);
      var de = json.decode(response.body);
      if(de['message'] == "Data has been saved successfully"){
        changeJobStatus('1', 'QUOTED');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom()), (route) => false);
      }
    });
  }

  completeJob(BuildContext context,String paymentMethod,String userId){
    setIsLoading();
    Map<String,dynamic> body = {
      'solution': jobSolution,
      'tradePerson': tradePersons,
      'paymentMethod': paymentMethod,
      'material': material,
      'labour': labour,
      'jobId': currentAllJobSelectedID,
      'price': jobPrice,
      'incgst':incGst,
    };
    apiService.callPostApi(body, Urls.addInvoiceUrl).then((response){
      print(response.body);
      setIsLoading();
      changeJobStatus('4', "COMPLETED");
      fetchJobs(userId, '4', Urls.fetchJobUrl, 4);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom(index: 3,)), (route) => false);
    });
  }

  List<InvoiceModel> invoiceModel = [];
  fetchJobInvoice(String jobId){
    apiService.callPostApi({'jobId':jobId}, Urls.fetchJobInvoiceUrl).then((response){
      print(response.body);
      var data = fetchInvoiceModelFromJson(response.body);
      invoiceModel = data.data;
      notifyListeners();
    });
  }

  addEmploye(String userId,String name,String email,String phone,String pass,String token){
    allEmploye = null;
    notifyListeners();
    Map<String,dynamic> body = {
      'name':name,
      'email':email,
      'phoneNumber':phone,
      'tradeManId': userId,
      'password':pass,
    };
    apiService.callPostApi(body, Urls.addEmployeUrl).then((response){
      print(response.body);
      fetchEmploye(userId, token);
    });
  }

  List<EmployeeModel>? allEmploye;
  fetchEmploye(String userID,String token){
    setIsLoading();
    Map<String,dynamic> body = {
      'userId': userID,
    };
    apiService.callPostApi(body, Urls.fetchEmployesUrl,headerr: {'userId':userID,'token':token}).then((response){
      setIsLoading();
      var de = json.decode(response.body);
      if(de['message'] == "Data available"){
        var da = fetchEmployeModelFromJson(response.body);
        allEmploye = da.data;
      }else{
        allEmploye = [];
      }
      notifyListeners();
    });
  }

  deleteEmployeAccount(String userId,String token,String targetID){
    allEmploye = null;
    notifyListeners();
    Map<String,dynamic> body = {
      'userId': targetID,
      'token': token,
      'accountStatus':token,
    };
    apiService.callPostApi(body, Urls.deleteAccountUrl,headerr: {'userId':userId,'token':token}).then((response){
      print(response.body);
      fetchEmploye(userId, token);
    });
  }

  stripeCharge(String userId,int cardIndex,BuildContext context){
    setIsLoading();
   Map<String,dynamic> body = {
     'userId':userId,
     'userTypeId': '2',
     'cardHolderName': cards[cardIndex].cardHolderName,
     'cardNumber':cards[cardIndex].cardNumber,
     'cvc': cards[cardIndex].cvc,
     'exp_year': "20${cards[cardIndex].expiryDate.substring(3,5)}",
     'exp_month': cards[cardIndex].expiryDate.substring(0,2),
   };
    apiService.callPostApi(body, Urls.payStripeUrl).then((response){
      setIsLoading();
      print(response.body);
      var de = json.decode(response.body);
      if(de['message'] == "Data has been saved successfully"){
        acceptJob(userId,context);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom(index: 1,)), (route) => false);
      }else{
        showDialog(context: context, builder: (c){
          return CupertinoAlertDialog(
            title: Text("Payment Feild",style: TextStyle(color: Colors.red),),
            content: Text("We couldn't process your payment check your credit card balance or contact with your bank"),
            actions: [
              CupertinoDialogAction(child: Text("Try Again"),onPressed: ()=> Navigator.pop(context),)
            ],
          );
        });
      }
    });
  }

  assignJobToEmploye(int index,BuildContext context){
    apiService.callPostApi({'jobId':currentAllJobSelectedID,'employId':allEmploye![index].userId}, Urls.assignJobToEmployeUrl).then((response){
      print(response.body);
      var de = json.decode(response.body);
      if(de['message'] == 'Data has been saved successfully'){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom(index: 4,)), (route) => false);
      }
    });
  }
  unassignJobToEmploye(BuildContext context,String jobId,String userId){
    apiService.callPostApi({'jobId':jobId}, Urls.assignJobToEmployeUrl).then((response){
      print(response.body);
      fetchEmployeeJobsTradie(userId);
      var de = json.decode(response.body);
      if(de['message'] == 'Data has been saved successfully'){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom(index: 4,)), (route) => false);
      }
    });
  }

  deleteJob(String userId,String jobId){
    apiService.callPostApi({'jobId':jobId,'isTradeMan':"1"}, Urls.deleteJobUrl).then((response){
      fetchJobs(userId, '2', Urls.fetchJobUrl, 2);
      print(response.body);
    });
  }

  checkAccountStatus(String userId){
    apiService.callPostApi({'userId':userId}, Urls.checkAccountStatusUrl).then((response){
      var de = json.decode(response.body);
      accountStatus = de['data'];
      if(de['data'] == '2'){
        isAccountHold = true;
      }else{
        isAccountHold = false;
      }
      print(de);
      notifyListeners();
    });
  }

  changeAccountStatus(String userId,String token,String accountStatus ,BuildContext context){
    print(accountStatus);
    setIsLoading();
    apiService.callPostApi({'userId':userId,'token': token,"accountStatus":accountStatus}, Urls.deleteAccountUrl,headerr: {'userId':userId,'token':token}).then((response){
      checkAccountStatus(userId);
      setIsLoading();
      var dec = json.decode(response.body);
      print(dec);
      if(dec['message'] == "Account has been deleted"){
        if(accountStatus == "1"){
          final pro = Provider.of<SignupProvider>(context,listen: false);
          pro.clearSharedData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SplashScreen()), (route) => false);
        }else if(accountStatus == '2'){
          showDialog(context: context, builder: (c){
            return CupertinoAlertDialog(
              title: Text("Your Account has been Hold"),
              actions: [
                CupertinoDialogAction(child: Text("Ok"),onPressed: ()=> Navigator.pop(context),)
              ],
            );
          });
        }else if(accountStatus == '0'){
          showDialog(context: context, builder: (c){
            return CupertinoAlertDialog(
              title: Text("Your Account is Activated"),
              actions: [
                CupertinoDialogAction(child: Text("Ok"),onPressed: ()=> Navigator.pop(context),)
              ],
            );
          });
        }
      }
    });
  }
}