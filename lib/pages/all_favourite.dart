import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/all_product_widget.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:WahyooMock/pages/products_list_with_provider.dart';
import 'package:WahyooMock/widgets/appbar_card.dart';

class AllFavourite extends StatefulWidget {
  @override
  _AllFavouriteState createState() => _AllFavouriteState();
}

class _AllFavouriteState extends State<AllFavourite> {

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
          'Semua Produk Favorit',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        actions: <Widget>[

          AppBarCard()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProductListWithProvider()
          ],
        ),
      )
//      ProductScroll(),
    );
  }
}
