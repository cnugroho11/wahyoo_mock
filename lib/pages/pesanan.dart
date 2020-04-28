import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/pages/help_page.dart';

class Pesanan extends StatefulWidget {
  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Pesanan Saya',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        appBar: AppBar(),
      ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          ],
        ),
      )
    );
  }
}
