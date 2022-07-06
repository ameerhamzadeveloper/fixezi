import 'package:http/http.dart' as http;
class ApiService{

  Map<String,String> header = {};

  setHeader(map){
    header = map;
    print("header === $header");
  }

  Future<http.Response> callPostApi(Map<String,dynamic> body,String uri,{Map<String,String>? headerr})async{
    Uri url = Uri.parse(uri);
    http.Response response = await http.post(
      url,
      body: body,
      headers: headerr ?? header,
    );
    print("heee- ${headerr ?? header}");
    return response;
  }

  Future<http.Response> callGetApi(String uri)async{
    Uri url = Uri.parse(uri);
    http.Response response = await http.get(
      url,
      headers: header,
    );
    return response;
  }


  Future<http.Response> signupTradie(Map<String,dynamic> body,String uri,List<String> photos)async{
    var request =  http.MultipartRequest('POST',Uri.parse(uri));

    var contactorLicenceImage = await http.MultipartFile.fromPath('contractorlicenceImageUrl', body['contactorLicenceImage']);
    var companyImage = await http.MultipartFile.fromPath('companyImageUrl', body['companyImage']);
    var driverLicence = await http.MultipartFile.fromPath('driverLicenceImageUrl', body['driverLicence']);
    var liabilityImage = await http.MultipartFile.fromPath('publicLiabilityInsuranceImageUrl', body['liabilityImage']);
    request.files.add(contactorLicenceImage);
    request.files.add(companyImage);
    request.files.add(driverLicence);
    request.files.add(liabilityImage);

    request.fields['businessName'] = body['bussinessName'];
    request.fields['tradingName'] = body['tradingName'];
    request.fields['abn'] = body['abn'];
    request.fields['businessOwnerName'] = body['bussinessOwnerName'];
    request.fields['businessAddress'] = body['businessAddress'];
    request.fields['officePhone'] = body['officePhone'];
    request.fields['mobileNumber'] = body['mobilePhone'];
    request.fields['email'] = body['email'];
    request.fields['password'] = body['password'];
    request.fields['companyWebsiteUrl'] = body['comapnyWebsiteUrl'];
    request.fields['calloutFee'] = body['chargecalloutfee'];
    request.fields['emergencyCallout'] = body['emerygencyCallout'];
    request.fields['workType'] = body['doYouWork'];
    request.fields['trade'] = body['trades'];
    request.fields['hourlyRate'] = body['hourlyCharge'];
    request.fields['workOnFixedPrice'] = body['workOnFixedPrice'];
    request.fields['dontHaveContractorLicence'] = body['dontaContractorLicence'];
    request.fields['latitude'] = body['latitude'];
    request.fields['longitude'] = body['longitude'];
    request.fields['deviceUUID'] = body['deviceUUID'];
    request.fields['deviceName'] = body['deviceName'];
    request.fields['deviceOS'] = body['deviceOS'];
    request.fields['osVersion'] = body['osVersion'];
    request.fields['fcmToken'] = body['fcmToken'];
    request.fields['locationRadius'] = body['radius'];
    request.fields['receiveEmail'] = '0';
    request.headers['userId'] = header['userId']!;
    request.headers['token'] = header['token']!;
    for(var i = 0; i < photos.length;i++){
      var imagee = await http.MultipartFile.fromPath('companyserviceImage[]', photos[i]);
      request.files.add(imagee);
    }
    http.Response response = await http.Response.fromStream(await request.send());
    return response;
  }

  Future<http.Response> addJobImage(Map<String,dynamic> body,String uri,String photo)async{
    var request =  http.MultipartRequest('POST',Uri.parse(uri));

    var image = await http.MultipartFile.fromPath('jobNoteImageUrl', photo);

    request.files.add(image);

    request.fields['jobId'] = body['jobId'];
    request.fields['userId'] = body['userId'];
    http.Response response = await http.Response.fromStream(await request.send());
    return response;
  }

  Future<http.Response> addJobQuote(Map<String,dynamic> body,String uri,List<String> photos)async{
    var request =  http.MultipartRequest('POST',Uri.parse(uri));

    for(var i = 0; i < photos.length;i++){
      var imagee = await http.MultipartFile.fromPath('imageUrl[]', photos[i]);
      request.files.add(imagee);
    }

    request.fields['jobId'] = body['jobId'];
    request.fields['jobQuoteDescription'] = body['jobQuoteDescription'];
    request.fields['incgst'] = body['incgst'];
    request.fields['price'] = body['price'];
    request.fields['days'] = body['days'];
    http.Response response = await http.Response.fromStream(await request.send());
    return response;
  }

}