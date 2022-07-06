import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/place_model.dart';
import '../utils/utils.dart';
class PlacesService{
  Future<NearBySearch> searchPlaceWithName(double lat,double long,String name)async{
    print(lat);
    print(long);
    print(name);
    final request =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$long&name=$name&type=address&radius=100000&key=${Utils.placesAPIKey}';
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(result);
      if (result['status'] == 'OK') {

        final nearBySearch = NearBySearch.fromJson(result);
        // final Place place = Place(
        //     formattedAddress: result['result']['formatted_address'],
        //     lat: result['result']['geometry']['location']['lat'],
        //     lng: result['result']['geometry']['location']['lng']);

        // print("getPlaceDetailFromId: lat: ${result['result']['geometry']['location']['lat']} lng: ${result['result']['geometry']['location']['lng']}");
        return nearBySearch;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}