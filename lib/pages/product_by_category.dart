import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/widgets/product_card.dart';

class ProductByCategoryScreen extends StatelessWidget{

  String category;
  ProductByCategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        title: Text(category,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: omp.allProducts.where((a) => a.categoryName == this.category).length,
                  itemBuilder: (context, i){
                    return MenuCard(product: omp.allProducts.where((a) => a.categoryName == this.category).toList()[i],);
                  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}