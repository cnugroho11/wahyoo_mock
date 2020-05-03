import 'package:WahyooMock/pages/help_page.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/pages/product_list.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:intl/intl.dart';
import 'package:WahyooMock/widgets/floating_cart_button.dart';

class AllProduct extends StatefulWidget {
  final Product product;
  final OrderMenuProvider omp;

  AllProduct({this.product, this.omp});

  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return Scaffold(
      appBar: AppbarWidget(
        title: Text(
          'Semua Produk',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(child: ProductListProvider()),
      floatingActionButton: (omp.quantityInCart != 0)
          ? FloatingCartButton()
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
