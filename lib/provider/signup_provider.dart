import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/model/tredie_profile_model.dart';
import 'package:fixezi/services/search_place.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:fixezi/views/authentication/login/enter_otp.dart';
import 'package:fixezi/views/employee/employe_bottom.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:fixezi/views/user/edit_profile_image.dart';
import 'package:fixezi/views/user/user_bottom.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as Io;
import '../model/place_model.dart';
import '../services/api_service.dart';

class SignupProvider with ChangeNotifier{

  String businessName = '';
  String tradingName = '';
  String Abn = '';
  String businessOwnerName = '';
  String businessAddress = '';
  String officePhone = '';
  String email = '';
  String password = '';
  String mobilePhone = '';
  String companyWebsiteUrl = '';
  String locationRadius = '';
  bool wouldyouliketoReceiveEmailsSmsVal = false;
  double radisu = 20;
  double? lat;
  double? long;
  NearBySearch? placesSearched;

  bool chargeCalloutFee = true;
  bool emerygencyCallOut = true;
  int doYouWork = 1;
  String hourlyCharges = '0';
  String trad = '';
  String caption = '';
  bool workFixedPrice = false;
  bool dontContractorLicence = false;

  String phoneDropDown = "+60";
  String phoneDropDown2 = "+60";
  bool isPhoneDialogueOpen = false;
  bool phoneVerified = false;
  bool emailVerified = false;

  bool isEmailDialogueOpen = false;

  String liabilityinsurancePhoto = '';
  String companyImage = '';
  List<String> companyServiceImages = [];
  String contactorLicenceImage = '';
  String driverLicenceImage = '';
  String otp = '';
  String fcmToken = '435534543';
  String userOTP = '';

  bool isPhoneVerified = false;
  Map<String,dynamic> userProfileData = {};
  String userProfileImage = '';

  bool isLoading = false;

  String userId = '';
  String token = '';

  int userType = 1;
  String error = '';

  TradieProfile? tradieProfile;

  final placeService = PlacesService();
  final apiService = ApiService();
  // FirebaseMessaging message = FirebaseMessaging.instance;

  setLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  setHeader(){
    Map<String,String> map = {
      'userId': userId,
      'token': token,
    };
    apiService.setHeader(map);
  }

  fetchUserProfile(){
    Map<String,String> map = {
      'userId': userId,
      'token': token,
    };
    apiService.callPostApi(map, Urls.fetchUserProfileUrl).then((response){
      setLoading();
      var d = json.decode(response.body);
        userProfileData = d['data'];
        print(userProfileData);
      notifyListeners();
    });
  }

  fetchTradieProfile(){
    Map<String,String> map = {
      'userId': userId,
      'token': token,
    };
    apiService.callPostApi(map, Urls.fethcTradieProfileUrl,headerr: {'userId':userId,'token':token}).then((response){
      // setLoading();
      print(response.body);
      var d = json.decode(response.body);
      print(d['data']);
        var data = tradieProfileModelFromJson(response.body);
        tradieProfile = data.data;
      notifyListeners();
    });
  }

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    // message.getToken().then((value) {
    //   fcmToken = value.toString();
    // });
    try {

      if (Platform.isAndroid) {
        deviceData =
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        print(deviceData);
      } else{
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        print(deviceData);
      }
    } catch(e) {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }


    _deviceData = deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release, //yeah chahye
      'board': build.board, //yeah chahye
      'id': build.id, // yeah chahye
    };
  }

  int getRandom(){
    return Random().nextInt(5000);
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName, //yeah chahye
      'systemVersion': data.systemVersion, // yeah chahye
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  deleteServiceImage(int index){
    companyServiceImages.removeAt(index);
    notifyListeners();
  }

  pickImageCamera(int offset,int source)async{
    XFile? image = await ImagePicker().pickImage(source: source == 1 ? ImageSource.camera : ImageSource.gallery);
    switch(offset){
      case 1:
        liabilityinsurancePhoto = image!.path;
        break;
      case 2:
        companyImage = image!.path;
        break;
      case 3:
        companyServiceImages.add(image!.path);
        break;
      case 4:
        contactorLicenceImage = image!.path;
        break;
      case 5:
        driverLicenceImage = image!.path;
        break;
    }
    notifyListeners();
  }
  pickImageProfileUser(int source,BuildContext context)async{
    XFile? image = await ImagePicker().pickImage(source: source == 1 ? ImageSource.camera : ImageSource.gallery);
    userProfileImage = image!.path;
    nextScreen(context, EditProfileImageUSer());
    notifyListeners();
  }

  setErrorEmpty(){
    error = '';
    notifyListeners();
  }

  assignAllowMessageSMs(){
    wouldyouliketoReceiveEmailsSmsVal = !wouldyouliketoReceiveEmailsSmsVal;
    notifyListeners();
  }

  setRadius(double val){
    radisu = val;
    notifyListeners();
  }

  changeDropVal(String v,int offset){
    switch(offset){
      case 1:
        phoneDropDown = v;
      break;
      case 2:
        phoneDropDown2 = v;
    }
    notifyListeners();
  }
  changePhoneVerified(){
    phoneVerified = true;
    notifyListeners();
  }
  changePhoneDialogueOpen(){
    isPhoneDialogueOpen = true;
    sendOTPMobile();
    notifyListeners();
  }

  changeEmailVerified(){
    emailVerified = true;
    notifyListeners();
  }

  phoneVerifiedChange(){
    phoneVerified = true;
    notifyListeners();
  }

  changeEmialDialogueOpen(){
    isEmailDialogueOpen = true;
    notifyListeners();
  }
  assignValues(int offset,String val){
    switch(offset){
      case 1:
        businessName = val;
        break;
      case 2:
        tradingName = val;
        break;
      case 3:
        Abn = val;
        break;
      case 4:
        businessOwnerName = val;
        break;
      case 5:
        businessAddress = val;
        break;
      case 6:
        officePhone = val;
        break;
      case 7:
        mobilePhone = val;
        break;
      case 8:
        email = val;
        break;
      case 9:
        password = val;
        break;
      case 10:
        companyWebsiteUrl = val;
        break;
    }
    notifyListeners();
  }

  setButtonVal(int offset, val){
    switch(offset){
      case 1:
        chargeCalloutFee = val;
        break;
      case 2:
        emerygencyCallOut = val;
        break;
      case 3:
        doYouWork = val;
        break;
      case 4:
        trad = val;
        break;
      case 5:
        caption = val;
        break;
      case 6:
        dontContractorLicence = val;
        break;
    }
    notifyListeners();
  }

  setCharges(bool fixedPrice,String hourlyCharges){
    hourlyCharges = hourlyCharges;
    notifyListeners();
  }
  setFixPrice(bool val){
    workFixedPrice = val;
    notifyListeners();
  }

  setUserOTp(String val){
    userOTP = val;
  }
  
  searchPlaceWithName(String name){
    placeService.searchPlaceWithName(lat!, long!, name).then((value){
      placesSearched = value;
      notifyListeners();
    });
  }
  assignLatLong(double latt,double longg){
    lat = latt;
    long = longg;
    // notifyListeners();
  }

  signUpTradie(String tradId){
    print("sign up userCalled called");
    Map<String,dynamic> map = {
      'bussinessName': businessName,
      'tradingName': tradingName,
      'abn': Abn,
      'bussinessOwnerName': businessOwnerName,
      'businessAddress': businessAddress,
      'officePhone': officePhone,
      'mobilePhone': mobilePhone,
      'email': email,
      'password': password,
      'comapnyWebsiteUrl': companyWebsiteUrl,
      'liabilityImage': liabilityinsurancePhoto,
      'chargecalloutfee': chargeCalloutFee ? '1' : '0',
      'emerygencyCallout': emerygencyCallOut ? '1' : '0',
      'doYouWork': doYouWork == 1 ? "Residential" : doYouWork == 2 ? "Commercial" : "Both",
      'tradeId': tradId,
      'tradeProblemId': tradId,
      'radius':(radisu / 100).toString(),
      'hourlyCharge': hourlyCharges.toString(),
      'workOnFixedPrice': workFixedPrice ? '1' : '0',
      'companyImage': companyImage,
      'contactorLicenceImage': contactorLicenceImage,
      'dontaContractorLicence': dontContractorLicence ? '1':'0',
      'driverLicence': driverLicenceImage,
      "deviceUUID": Io.Platform.isAndroid ? _deviceData['id'].toString() : "asdfdvsd${getRandom()}",
      "deviceName": Io.Platform.isAndroid ? _deviceData['device'].toString() : _deviceData['name'],
      "deviceOS": Io.Platform.isAndroid ? "Android" : "IOS",
      "osVersion": Io.Platform.isAndroid ? _deviceData['version.release'].toString() : _deviceData['systemVersion'],
      "fcmToken": fcmToken,
      'userTypeId':'2',
      'latitude': lat.toString(),
      'longitude': long.toString(),
    };
    apiService.signupTradie(map, Urls.tredieSignUpUrl, companyServiceImages).then((response) {
      print(response.body);
    });
  }

  loginUser(BuildContext context){
    setLoading();
    error = '';
    Map<String, dynamic> map = {
      'email':email,
      'password':password,
      "deviceUUID": Io.Platform.isAndroid ? _deviceData['id'].toString() : "${getRandom()}",
      "deviceName": Io.Platform.isAndroid ? _deviceData['device'].toString() : _deviceData['name'],
      "deviceOS": Io.Platform.isAndroid ? "Android" : "IOS",
      "osVersion": Io.Platform.isAndroid ? _deviceData['version.release'].toString() : _deviceData['systemVersion'],
      "fcmToken": fcmToken,
    };
    apiService.callPostApi(map, Urls.loginUSerURL).then((response){
      print("Response comesss");
      setLoading();
      print("After loading");
      print(response.body);
      var d = json.decode(response.body);
      if(d['message'] == "Data available"){
        userId = d['data']['userId'];
        token = d['data']['token'];
        userType =  int.parse(d['data']['userTypeId']);
        saveUserDataIntoShared();
        setHeader();
        if(d['data']['userTypeId'] == "1"){
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserBottom()), (route) => false);
        }else if(d['data']['userTypeId'] == "2"){
          print("Navigating");
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TradieBottom()), (route) => false);
        }else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => EmployeeBottom()), (route) => false);
        }
        notifyListeners();
      }else{
        error = "email or password is invalid";
      }
    });
  }

  sendOTPEmail(BuildContext context){
    setErrorEmpty();
    setLoading();
    Map<String, dynamic> map = {
      'email':email,
    };
    apiService.callPostApi(map, Urls.sendOTPEmailURL).then((response){
      setLoading();
      print(response.body);
      var d = json.decode(response.body);
      if(d['message'] == "Data has been saved successfully"){
        otp = d['data'].toString();
        nextScreen(context, EnterOTP());
      }else{
        error = d['message'];
      }
      notifyListeners();
    });
  }
  createNewPassword(){
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };
    apiService.callPostApi(map, Urls.CreatePasswordURL).then((response){
      print(response.body);
    });
  }

  signupUser(BuildContext context){
    Map<String,dynamic> map = {
      'username':businessName,
      'address':businessAddress,
      'mobileNumber':mobilePhone,
      'email':email,
      'password':password,
      'userTypeId':'1',
      'latitude': lat.toString(),
      'longitude': long.toString(),
      "deviceUUID": Io.Platform.isAndroid ? _deviceData['id'].toString() : "${getRandom()}",
      "deviceName": Io.Platform.isAndroid ? _deviceData['device'].toString() : _deviceData['name'],
      "deviceOS": Io.Platform.isAndroid ? "Android" : "IOS",
      "osVersion": Io.Platform.isAndroid ? _deviceData['version.release'].toString() : _deviceData['systemVersion'],
      "fcmToken": fcmToken,
    };
    print(map);
    apiService.callPostApi(map, Urls.signUpUserURL).then((response){
      print(response.body);
      Navigator.pop(context);
    });
  }

  sendOTPMobile(){
    Map<String,dynamic> map = {
      'phoneNo':mobilePhone
    };
    apiService.callPostApi(map, Urls.sendOTPMobileURL).then((response){
      print(response.body);
      var d = json.decode(response.body);
      print(d['data']);
      otp = d['data'].toString();
    });
  }

  Future<dynamic> cropImage()async{
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: userProfileImage,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: aquaColor,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: blueColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    userProfileImage = croppedFile!.path;
    notifyListeners();
  }

  makeUserProfileNull(){
    userProfileImage = '';
    notifyListeners();
  }

  sendPushNotification(String receiverID,String notificationBody){
    Map<String,dynamic> body = {
      'senderId': userId,
      'receiverId': receiverID,
      'notificationTypeId': '1',
      'subject': "Fixezi",
      'body': notificationBody,
    };
    apiService.callPostApi(body, Urls.sendNotificationUrl).then((value){
      print(value.body);
    });
  }

  saveUserDataIntoShared()async{
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.setString('userId', userId);
    pre.setString('token', token);
    pre.setInt('userTypeId', userType);
  }
  getSharedData()async{
    SharedPreferences pre = await SharedPreferences.getInstance();
    userId = pre.getString('userId')!;
    token = pre.getString('token')!;
    userType = pre.getInt('userTypeId')!;
  }
  clearSharedData()async{
    userId = '';
    token = '';
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.clear();
    getSharedData();
  }

}