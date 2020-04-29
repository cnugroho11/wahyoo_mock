import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:WahyooMock/pages/all_favourite.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/widgets/product_card.dart';
import 'package:WahyooMock/widgets/voucher_card.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;

class Beranda extends StatefulWidget {
  final Product product;

  Beranda({@required this.product});

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          title: Text('Hai, Cahyo Nugroho',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          appBar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
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
              SizedBox(
                height: 20,
              ),
              //voucher box
              VoucherCard(),
              Container(
                height: 50,
                width: 350,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(),
                child: Text(
                  'Produk Favorit',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              ProductCardProvider(),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllFavourite())),
                    child: Center(
                      child: Text(
                        'Lihat Semua Produk Favorit',
                        style: TextStyle(fontSize: 18, color: Colors.orange),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
