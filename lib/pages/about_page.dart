import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  String abb = 'The Quintessential Quintuplets \n(Japanese: 五等分の花嫁, Hepburn: Go-Tōbun no Hanayome, lit. "Five Equal Brides") is a Japanese manga series written and illustrated by Negi Haruba.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black54,
        ),
        title: Text(
          'Tentang Kami',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.contact_phone,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/icon.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: Text(
                abb,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
