import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:geolocator/geolocator.dart';

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
        title: Text(
          'Alamat Saya',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 350,
                        alignment: Alignment.centerLeft,
                        child: Text('Simpan Sebagai Alamat')),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Label Alamat',
                          border: OutlineInputBorder()),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 350,
                        alignment: Alignment.centerLeft,
                        child: Text('Nama Penerima')),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Masukan Nama Penerima',
                          border: OutlineInputBorder()),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 350,
                        alignment: Alignment.centerLeft,
                        child: Text('Nomor Telepon')),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.black26),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 270,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Nomor Telepon',
                                border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 350,
                        alignment: Alignment.centerLeft,
                        child: Text('Detail Alamat / Nama Jalan')),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'contoh: Jl. Osamaliki 11',
                          border: OutlineInputBorder()),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            (_currentPosition == null)
                ? FlatButton(
                    onPressed: _getCurrentLocation(),
                    child: Text('Click untuk mendapatkan lokasi'),
                  )
                : Container(
                    width: 350,
                    child: Text('Lokasi Anda Adalah : \n' + _currentAddress)
            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Center(
                child: Text('SIMPAN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
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
            "${place.subAdministrativeArea}, ${place.locality}, ${place.postalCode}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
