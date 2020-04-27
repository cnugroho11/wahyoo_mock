import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/widgets/product_card_2.dart';

class ProductListWithProvider extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    // TODO: implement build
    return Container(
      child: (omp.state == OrderMenuState.loading)?
        Center(child: CircularProgressIndicator(),):
      (omp.state == OrderMenuState.none)?
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: omp.allProducts.length,
        itemBuilder: (context, i){
          return ProductCard2(product: omp.allProducts[i],);
        },
       )
      :Center(child: Text('wew', ),),
    );
  }
}