import 'package:fixezi/model/fetch_job_quote_model.dart';
import 'package:fixezi/model/fetch_user_job_model.dart';
import 'package:fixezi/services/api_service.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:flutter/material.dart';

import '../model/fetch_invoice_model.dart';
class UserJobProvider extends ChangeNotifier{

  List<UserJobModel>? userPendingJobs;
  List<UserJobModel>? userJobRequestJobs;
  List<UserJobModel>? userCompletedJobs;
  List<JobQuoteModel>? jobQuote;

  String currentJobRequestId = '';
  String currentJobPendingId = '';

  final apiService = ApiService();


  setCurrentJobRequestId(String val){
    currentJobRequestId = val;
  }

  setCurrentJobPendingId(String val){
    currentJobPendingId = val;
  }

  fetchJobs(String userId,String status,int offset){
    Map<String,dynamic> body = {
      'userId': userId,
      'status': status,
    };
    apiService.callPostApi(body, Urls.fetchUserJobUrl).then((response){
      print(response.body);
      var data = fetchUserJobModelFromJson(response.body);
      if(offset == 1){
        userPendingJobs = data.data;
      }else if(offset == 2){
        userJobRequestJobs = data.data;
      }else if(offset == 4){
        userCompletedJobs = data.data;
      }
      notifyListeners();
    });
  }

  DateTime d = DateTime.now();
  DateTime date = DateTime.now();
  Future<void> changeJobDate(BuildContext context,int index,String jobId,String userId) async {
    final DateTime? newDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        context: context,
        firstDate: DateTime(d.year,d.month - 1,d.day - 2),
        initialDate: userJobRequestJobs![index].addDate!,
        lastDate: DateTime(d.year + 15,d.month,d.day)
    );

    if (newDate != null && newDate != date) {
      date = newDate;
      // userJobRequestJobs![index].addDate = newDate;
      changeJobTime(context,jobId,userId);
    }
    notifyListeners();
  }
  TimeOfDay time = TimeOfDay.now();
  Future<void> changeJobTime(BuildContext context,String jobId,String userId) async {
    final TimeOfDay? newTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null && newTime != time) {
      time = newTime;
      print(date);
      Navigator.pop(context);
      apiService.callPostApi({'jobId':jobId ,'jobDateTime': date.toString(),'jobStartTime':time.format(context).toString(),}, Urls.changeJobTimeDateUrl).then((response){
        fetchJobs(userId, '2', 2);
      });
      Navigator.pop(context);
    }
    notifyListeners();
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

  changeJobStatus(String status,String statusText){
    apiService.callPostApi({'status':status,'statusText':statusText,'jobId':currentJobRequestId}, Urls.changeJobStatusUrl).then((response){
      print("job status change ${response.body}");
    });
  }

  changePendingJobStatus(String status,String statusText){
    apiService.callPostApi({'status':status,'statusText':statusText,'jobId':currentJobPendingId}, Urls.changeJobStatusUrl).then((response){
      print("job status change ${response.body}");
    });
  }

  changeJobQuotesStatus(String quoteId,String quoteStatus,String userId){
    apiService.callPostApi({'isAccepted':quoteStatus,'jobQuoteId':quoteId}, Urls.acceptJobQuotesUrl).then((response){
      print("job status change ${response.body}");
      if(quoteStatus == '2'){
        changePendingJobStatus('2', 'QUOTE CANCELED');
      }else{
        changePendingJobStatus('3', 'INPROGRESS');
      }
        fetchJobs(userId, '1', 1);
        fetchJobs(userId, '0', 0);
    });
  }

  fetchJobQuote(){
    apiService.callPostApi({'jobId':currentJobPendingId}, Urls.fetchJobQouteUrl).then((response){
      print(response.body);
      var data = fetchJobQuoteModelFromJson(response.body);
      jobQuote = data.data;
      notifyListeners();
    });
  }

}