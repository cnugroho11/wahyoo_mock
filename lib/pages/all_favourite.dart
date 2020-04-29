import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/all_product_widget.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:WahyooMock/pages/product_list.dart';
import 'package:WahyooMock/widgets/appbar.dart';

class AllFavourite extends StatefulWidget {
  @override
  _AllFavouriteState createState() => _AllFavouriteState();
}

class _AllFavouriteState extends State<AllFavourite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Lihat Semua Produk Favorit',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: ProductListProvider(),
      )
//      ProductScroll(),
    );
  }
}
