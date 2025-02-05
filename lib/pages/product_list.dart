import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/pages/product_detail.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:intl/intl.dart';

class ProductListProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    // TODO: implement build
    return Container(
      child: (omp.state == OrderMenuState.loading)
          ? Center(
        child: CircularProgressIndicator(),
      )
          : (omp.state == OrderMenuState.none)
          ? ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: omp.allProducts.length,
        itemBuilder: (context, i) {
          return ProductList(
            product: omp.allProducts[i],
          );
        },
      )
          : Center(
        child: Text(
          'wew',
        ),
      ),
    );
  }
}


class ProductList extends StatelessWidget {
  final Product product;
  ProductList({this.product});
  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return Center(
      child: Container(
        height: 120,
        width: 380,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                Container(
                  height: 80,
                  width: 80,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(product.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text('Point : '+product.point.toString(),),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Text('Rp. '+formatter.format(product.priceBase).replaceAll(',', '.'),
                            style: TextStyle(
                                color: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(width: 80,),
                        (product.quantity == 0) ? InkWell(
                          onTap: (){
                            omp.addProduct(product);
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                              child: Text('TAMBAH',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 11
                                ),
                              ),
                            ),
                          ),
                        ) :
                        Container(
                          height: 30,
                          child: Row(
                            children: <Widget>[
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
                                      color: Colors.blue
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Divider(),
          ],
        ),
      ),
    );
  }
}
