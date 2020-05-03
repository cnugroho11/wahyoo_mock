import 'package:WahyooMock/constants/url_api.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:intl/intl.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:provider/provider.dart';

class ProductCardCheckout extends StatelessWidget {
  final Product product;
  final OrderMenuProvider omp;

  ProductCardCheckout({
    this.product,
    this.omp
  });

  final formater = NumberFormat('#,###','en_US');

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Divider(),
          Center(
            child: Container(
              width: 350,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: NetworkImage(url.ftp+product.image),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 200,
                        child: Text(
                            product.description
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 200,
                        child: Text(
                            'Rp '+formater.format(product.priceFinal).replaceAll(',', '.'),
                          style: TextStyle(
                            color: Colors.green
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 350,
            child: Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      omp.clearProduct(product);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12
                      ),
                      child: Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.black26,
                            size: 15,
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      omp.decreaseProduct(product);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                      ),
                      child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 25,
                    child: Center(
                      child: Text(
                          product.quantity.toString()
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      omp.addProduct(product);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                      ),
                      child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
