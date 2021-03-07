import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as lottie;

class MapHome extends StatefulWidget {
  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {
  GoogleMapController mapController;
  Set<Marker> _markers = {};
  Set<Circle> _circles = {};
  BitmapDescriptor factoryMarker;
  BitmapDescriptor trafficMarker;
  BitmapDescriptor checkMarker;

  void setMarker(BitmapDescriptor icon, MarkerId id, LatLng pos) {
    _markers.add(
      Marker(icon: icon, markerId: id, position: pos),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      setMarker(factoryMarker, MarkerId('1'), LatLng(41.088685, 28.789793));
      setMarker(factoryMarker, MarkerId('2'), LatLng(41.080089, 28.794845));
      setMarker(factoryMarker, MarkerId('3'), LatLng(41.076770, 28.796000));
      setMarker(factoryMarker, MarkerId('4'), LatLng(41.077151, 28.803362));
      setMarker(factoryMarker, MarkerId('5'), LatLng(41.086617, 28.800114));
      setMarker(factoryMarker, MarkerId('6'), LatLng(41.082755, 28.807331));
      setMarker(trafficMarker, MarkerId('7'), LatLng(41.061344, 28.812167));
      setMarker(trafficMarker, MarkerId('8'), LatLng(41.075249, 28.815477));
      setMarker(trafficMarker, MarkerId('9'), LatLng(41.063046, 28.783233));
      setMarker(trafficMarker, MarkerId('10'), LatLng(41.045902, 28.807845));
      _markers.add(
        Marker(
            icon: checkMarker,
            markerId: MarkerId('11'),
            position: LatLng(41.073765, 28.770912),
            onTap: () {
              Navigator.pushNamed(context, "/MapClean");
            }),
      );

      _circles.add(
        Circle(
          circleId: CircleId("1"),
          center: LatLng(41.079178, 28.807729),
          radius: 650,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(139, 0, 0, 0.5),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    setCustomMarker2();
    setCustomMarker3();
  }

  void setCustomMarker() async {
    factoryMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/FactoryPinMiddle.png");
  }

  void setCustomMarker2() async {
    trafficMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/TrafficCo3.png");
  }

  void setCustomMarker3() async {
    checkMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/Tree2.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(41.079178, 28.807729),
              zoom: 15,
            ),
            onMapCreated: _onMapCreated,
            markers: _markers,
            circles: _circles,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              height: 150,
              width: 600,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Hava İstatistikleri",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.virus,
                              size: 30,
                              color: Colors.red,
                            ),
                            Text(
                              "Kırmızı",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Salgın Yoğunluğu",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                      Expanded(
                          child: lottie.Lottie.network(
                        "https://assets1.lottiefiles.com/private_files/lf30_lk1aqkvo.json",
                        height: 115,
                      )),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(FontAwesomeIcons.industry, color: Colors.grey),
                            Text(
                              "2",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Kirletici",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
