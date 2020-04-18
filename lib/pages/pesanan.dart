import 'package:flutter/material.dart';

class Pesanan extends StatefulWidget {
  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hai, Cahyo'),
      ),
      body: Center(
        child: Text('Ini Pesanan'),
      ),
    );
  }
}
