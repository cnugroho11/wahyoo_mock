import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text(
          'Hai, Cahyo Nugroho',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.contact_phone,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15,),
            //carousel
            Center(
              child: Container(
                height: 185,
                width: 350,
                child: Carousel(
                  images: [
                    ExactAssetImage("assets/images/biru.jpeg"),
                    ExactAssetImage("assets/images/orange.jpeg"),
                    ExactAssetImage("assets/images/ungu.jpeg")
                  ],
                  dotSize: 5.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  borderRadius: true,
                  radius: Radius.circular(10),
                  autoplay: false,
                ),
              ),
            ),
            SizedBox(height: 20,),
            //voucher box
            Container(
              padding: EdgeInsets.only(bottom: 5),
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                color: Colors.greenAccent,
              ),
            )
          ],
        ),
      )
    );
  }
}
