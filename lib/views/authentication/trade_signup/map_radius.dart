import 'dart:async';

import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
class MapRadius extends StatefulWidget {

  const MapRadius({Key? key,}) : super(key: key);
  @override
  _MapRadiusState createState() => _MapRadiusState();
}

class _MapRadiusState extends State<MapRadius> {
  static late Set<Circle> circles;
  static late double currentLat = 24.401716;
  static late double currentLng = 67.822508;
  double radius = 20;
  double cameraZoom = 15.0;
  double sliderVal = 0.2;

  final TextEditingController searchController = TextEditingController();

  Completer<GoogleMapController> completer = Completer();

  LatLng initPosition = const LatLng(24.401716, 67.822508);

  onMapCreated(GoogleMapController controller) {
    _controller = controller;
    completer.complete(_controller);
    animateCamera(LatLng(currentLat,currentLng));
    circles = Set.from([
      Circle(
          circleId: CircleId("myCircle"),
          center: _createCenter(),
          radius: radius,
          fillColor: Colors.blue.shade100.withOpacity(0.5),
          strokeColor: Colors.black,
          strokeWidth: 1
      )
    ]);
    setState(() {});
  }

  onCameraMove(CameraPosition position) {
    initPosition = position.target;
  }

  zoomInoutCamera(){
    _controller!.moveCamera(CameraUpdate.zoomTo(radius));
  }

  GoogleMapController? _controller;

  void animateCamera(LatLng position) async {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: cameraZoom,
    )));
  }
  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    Geolocator.getCurrentPosition().then((value){
      print("location value$value");
      setState(() {
        currentLat = value.latitude;
        currentLng = value.longitude;
      });
      animateCamera(LatLng(value.latitude,value.longitude));
    });
    circles = Set.from([
      Circle(
        circleId: CircleId("myCircle"),
        center: _createCenter(),
        radius: radius,
        fillColor: Colors.blue.shade100.withOpacity(0.5),
          strokeColor: Colors.black,
          strokeWidth: 1
      )
    ]);
    setState(() {});
  }
  LatLng _createCenter() {
    return _createLatLng(currentLat , currentLng);
  }
  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Radius"),
        actions: [
          TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Done",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            circles: circles,
            zoomControlsEnabled: true,
            initialCameraPosition:
            CameraPosition(target: initPosition, zoom: cameraZoom),
            onMapCreated: onMapCreated,
            tiltGesturesEnabled: true,
            onCameraMove: (pos) async {
              print(
                  "Camerea moving ${pos.target.latitude} ${pos.target.longitude}");
              // currentLat = pos.target.latitude;
              // currentLng = pos.target.longitude;
              },
            onCameraIdle: () {
              print("Ideleee");
              circles = Set.from([Circle(
                circleId: CircleId("myCircle"),
                center: _createCenter(),
                radius: 2000,
                fillColor: Colors.blue.shade100.withOpacity(0.5),
                  strokeColor: Colors.black,
                  strokeWidth: 1
              )
              ]);
            },
            onTap: (lat) {
              print("Camerea moving ${lat.longitude}");
            },
            mapType: MapType.normal,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 70,
                child: Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Text("Distance"),
                        Slider(
                            thumbColor: Colors.grey,
                            activeColor: aquaColor,
                            value: sliderVal, onChanged: (v){
                          print("valueeeeeeeee $v");
                              setState(() {
                                if(v < sliderVal){
                                  if(v >= 0.5){
                                    cameraZoom += 0.1;
                                    print(cameraZoom);
                                    animateCamera(LatLng(currentLat, currentLng));
                                  }
                                }else{
                                  if(v <= 0.5){
                                    print("valueeeeeeeee $v");
                                    cameraZoom -= 0.1;
                                    animateCamera(LatLng(currentLat, currentLng));
                                  }
                                }
                                print(cameraZoom);
                                print(sliderVal * 10000);
                                sliderVal = v;
                                radius = sliderVal * 10000;
                                pro.setRadius(radius);
                                circles = Set.from([
                                  Circle(
                                    circleId: CircleId("myCircle"),
                                    center: _createCenter(),
                                    radius: radius,
                                    fillColor: Colors.blue.shade100.withOpacity(0.5),
                                    strokeColor: Colors.black,
                                    strokeWidth: 1
                                  )
                                ]);
                              });
                        })
                      ],
                    ),
                    trailing: Text("${(pro.radisu / 100).round()} KM",style: TextStyle(color: Colors.black),),
                    ),
                  ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pro.businessAddress,style: TextStyle(color: Colors.black),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
