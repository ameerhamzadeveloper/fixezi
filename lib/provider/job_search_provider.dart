import 'dart:convert';

import 'package:fixezi/model/fetch_trademan_model.dart';
import 'package:fixezi/model/problems_model.dart';
import 'package:fixezi/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../model/place_model.dart';
import '../model/trades_model.dart';
import '../services/search_place.dart';
import '../utils/urls.dart';
import '../views/authentication/quick_search/job_request_sent.dart';
import '../views/authentication/quick_search/time_flexibility_page.dart';

class JobSearchProvider extends ChangeNotifier{

  bool isResidential = true;
  String selectTrade = '';
  String selectProblem = '';
  int ownAddress = 0;
  String ownAddressVal = '';
  String note = 'no note';
  String address = '';
  String tradeId = '0';
  String problemId = '0';
  String lat = '';
  String long = '';
  bool isTimeFlexible = false;
  bool isDateFlexible = false;
  String timeFlexibility = '';
  bool isAnotherAddress = false;
  List<TradesModell> tradeList = [];
  List<Problems> problemList = [];
  List<Trademan> tradesManList = [];
  DateTime date = DateTime.now();
  DateTime d = DateTime.now();
  NearBySearch? placesSearched;
  String otherPHone = '';
  String mobileNo = '';
  String  personOnSite = '';
  String relationToPerson = '';

  setDiffAddressVals(int offset,String val){
    switch(offset){
      case 1:
        otherPHone = val;
        break;
      case 2:
        mobileNo = val;
        break;
      case 3:
        personOnSite = val;
        break;
      case 4:
        relationToPerson = val;
        break;
    }
    notifyListeners();
  }


  final apiService = ApiService();
  final placeService = PlacesService();

  setTimeFlexibility(String val){
    timeFlexibility = val;
  }

  setIsAnotherAddress(bool val){
    isAnotherAddress = val;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(d.year + 15,d.month,d.day)
    );

    if (newDate != null && newDate != date) {
      date = newDate;
      showDialog(context: context,builder: (c){
        return CupertinoAlertDialog(
          title: Text("Is Selected Date Flexible ?"),
          actions: [
            CupertinoDialogAction(child: Text("No"),onPressed: (){
              Navigator.pop(context);
              isDateFlexible = false;
            },),
            CupertinoDialogAction(child: Text("Yes"),onPressed: (){
              Navigator.pop(context);
              isDateFlexible = true;
            },),
          ],
        );
      });
    }
  }
  TimeOfDay time = TimeOfDay.now();
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null && newTime != time) {
      time = newTime;
      showDialog(context: context,builder: (c){
        return CupertinoAlertDialog(
          title: Text("Is Selected Time Flexible ?"),
          actions: [
            CupertinoDialogAction(child: Text("No"),onPressed: (){
              Navigator.pop(context);
              isTimeFlexible = false;
            },),
            CupertinoDialogAction(child: Text("Yes"),onPressed: (){
              Navigator.pop(context);
              nextScreen(context, TimeFlexibilityPage());
              isTimeFlexible = true;
            },),
          ],
        );
      });

    }
    notifyListeners();
  }

  setResidentialVal(val){
    isResidential = val;
    notifyListeners();
  }

  setAddress(val){
    address = val;
    notifyListeners();
  }

  setTradeVal(String val){
    selectTrade = val;
    notifyListeners();
  }

  setProblemVal(String val){
    selectProblem = val;
    notifyListeners();
  }

  fetchTrade(){
    apiService.callGetApi(Urls.fethcTradiesUrl).then((response){
      var data = tradeModelFromJson(response.body);
      tradeList = data.data;
      notifyListeners();
    });
  }

  fetchProblemByTrade(String id,String tradeName){
    selectTrade = tradeName;
    tradeId = id;
    problemList = [];
    notifyListeners();
    print(id);
    selectProblem = '';
    Map<String,dynamic> map = {
      'tradeId' : id
    };
    apiService.callPostApi(map,Urls.fethcProblemByTradeUrl).then((response){
      var data = problemModelFromJson(response.body);
      problemList = data.data;
      print(problemList);
      notifyListeners();
    });
  }
  setProblemId(id){
    problemId = id;
  }

  searchPlaceWithName(String name){
    print(lat);
    placeService.searchPlaceWithName(lat == '' ? -31.953512:double.parse(lat), long == ''?115.857048:double.parse(long), name).then((value){
      placesSearched = value;
      notifyListeners();
    });
  }
  setLatLong(latt,longg){
    lat = latt;
    long = longg;
  }

  getLocation(){
    Geolocator.getCurrentPosition().then((value){
      lat = value.latitude.toString();
      long = value.longitude.toString();
    });
  }

  searchJob(BuildContext context){
    Map<String,dynamic> map = {
      'workType': isResidential ? "Residential" : "Commercial",
      'tradeId' : '1',
      'tradeProblemId' : '2',
      'time' : time.format(context).toString(),
      'date' : date.toString(),
      'note' : note,
      'latitude' : lat,
      'longitude' : long,
      'isTimeFlexible' : isTimeFlexible ? '1' : '0',
      'isDateFlexible' : isDateFlexible ? "1" :"0",
    };
    apiService.callPostApi(map,Urls.searchJobURl).then((response){
      print(response.body);
      var data = fetchTrademanModelFromJson(response.body);
      tradesManList = data.data;
      print(problemList);
      notifyListeners();
    });
  }

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  bookTradie(String userid,String tradesManID,int index,BuildContext context,Map<String,dynamic> profileData){
    print(tradesManID);
    Map<String,dynamic> body = {
      'tradeManId': tradesManID,
      'userId': userid,
      'problemId': problemId,
      'isTimeFlexible': isTimeFlexible ? "1" :"0",
      'isDateFlexible': isDateFlexible ? '1' : "0",
      'address': isAnotherAddress ? address : profileData['address'],
      'latitude': lat,
      'longitude':long,
      'timeFlexibilty': timeFlexibility,
      'dateFlexibilty': '',
      'phoneNumber': isAnotherAddress ? mobileNo : profileData['mobileNumber'],
      'otherPhoneNumber': isAnotherAddress ? otherPHone : '',
      'relationtToPersonOnSite': relationToPerson == '' ? "Myself" : relationToPerson,
      'personOnSite': isAnotherAddress ? personOnSite : profileData['username'],
      'jobStartTime': dateFormat.format(date).toString(),
      'jobDateTime': time.format(context),
    };
    print("date -=- ${dateFormat.format(date).toString()}");
    print("time -=- ${time.format(context)}");
    apiService.callPostApi(body, Urls.bookTradieUrl).then((response){
      var de = json.decode(response.body);
      if(de['message'] == 'Data has been saved successfully'){
        nextScreen(context, JobRequestSent(index: index,));
      }
      print(response.body);
      //
    });
  }


}