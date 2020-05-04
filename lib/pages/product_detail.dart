import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:provider/provider.dart';


class ProductDetail extends StatelessWidget {
  final OrderMenuProvider omp;
  final Product product;

  ProductDetail({
    this.omp,
    this.product
  });

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    final formatter = NumberFormat('#,###', 'en_US');
    return Scaffold(
      appBar: AppbarWidget(
        appBar: AppBar(),
        title: Text(product.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black12)
              ),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      url.ftp+product.image
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Divider(),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  width: 350,
                  alignment: Alignment.centerLeft,
                  child: Text(product.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 350,
                  child: Text(product.description),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 350,
                  child: Text('Rp '+formatter.format(product.priceFinal).replaceAll(',', '.'),
                    style: TextStyle(
                      color: Colors.green
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                Container(
                  width: 370,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Jumlah',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
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
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: InkWell(
        onTap: (){},
        child: Container(
          height: 50,
          width: 500,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue
          ),
          child: Text('PESAN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
