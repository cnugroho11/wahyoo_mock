import 'package:flutter/material.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:WahyooMock/pages/product_list.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:intl/intl.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/widgets/floating_cart_button.dart';

class AllFavourite extends StatefulWidget {
  final Product product;
  final OrderMenuProvider omp;

  AllFavourite({this.omp, this.product});

  final formatter = NumberFormat('#,###', 'en_US');

  @override
  _AllFavouriteState createState() => _AllFavouriteState();
}

class _AllFavouriteState extends State<AllFavourite> {
  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return Scaffold(
      appBar: AppbarWidget(
        title: Text(
          'Lihat Semua Produk Favorit',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: ProductListProvider(),
      ),
//      ProductScroll(),
      floatingActionButton: (omp.quantityInCart != 0)
          ? FloatingCartButton()
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
