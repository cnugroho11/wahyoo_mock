import 'package:WahyooMock/widgets/all_product_widget.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/pages/product_list.dart';

class AllProduct extends StatefulWidget {
  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
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
          'Semua Produk',
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
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HelpPage()
            )),
            icon: Icon(
              Icons.contact_phone,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: ProductListProvider()
      ),
    );
  }
}
