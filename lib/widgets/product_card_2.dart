import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;

class ProductCard2 extends StatelessWidget{
  
  final Product product;
  ProductCard2({this.product});

  final formatter = NumberFormat('#,###', 'en_US');


  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.green)
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(product.quantity.toString(), style: TextStyle(color: Colors.blue, fontSize: 20),),
          Text(product.name),
          Image(image: NetworkImage(url.ftp+product.image),),
          Text('Rp '+formatter.format(product.priceBase).replaceAll(',', '.')),
          Container(
            child: (product.quantity == 0)?
              Container(
                child: FlatButton(
                  onPressed: (){
                    omp.addProduct(product);
                  },
                  child: Text('TAMBAH'),
                ),
              )
              :Row(
              children: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: (){
                      print('asd');
                      omp.addProduct(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue)
                      ),
                      child: Icon(Icons.add, size: 15, color: Colors.blue,),
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                    onPressed: (){
                      print('asd');
                      omp.decreaseProduct(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red)
                      ),
                      child: Icon(Icons.remove, size: 15, color: Colors.red,),
                    ),
                  ),
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}