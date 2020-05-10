import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:WahyooMock/pages/help_page.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        title: Text('Alamat Pengiriman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_currentPosition != null)
                ? Text(
                _currentAddress
            ) : FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            )
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }


  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.subAdministrativeArea}, ${place.locality}, ${place.postalCode}, \n ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

}

