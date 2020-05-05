import 'package:flutter/material.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/widgets/product_card_checkout.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:intl/intl.dart';

orderListContainer(OrderMenuProvider omp) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 90),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: omp.allProducts.where((a) => a.quantity != 0).length,
              itemBuilder: (context, i) {
                return ProductCardCheckout(
                  product:
                      omp.allProducts.where((a) => a.quantity != 0).toList()[i],
                  omp: omp,
                );
              }),
        ),
      ],
    ),
  );
}

class CheckoutPage extends StatelessWidget {
  final OrderMenuProvider omp;
  final Product product;

  CheckoutPage({this.product, this.omp,});

  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderMenuProvider>(builder: (_, omp, a) {
      return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 1.0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black54,
          ),
          title: Text(
            'Keranjang Belanja',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          actions: <Widget>[
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
        body: (omp.quantityInCart != 0)
            ? SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 350,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Total Belanja: ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      omp.quantityInCart.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                omp.hapusPesananSemua();
                              },
                              child: Container(
                                child: Text(
                                  'Hapus Pesanan',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    orderListContainer(omp),
                    SizedBox(height: 10,)
                  ],
                ),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.shopping_cart,
                      size: 70,
                      color: Colors.orange,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Belanja sekarang untuk menambahkan produk ke dalam keranjang belanja',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54
                      ),
                    ),
                  )
                ],
              )
        ),
        floatingActionButton: (omp.quantityInCart != 0 ) ? InkWell(
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Container(
                            width: 150,
                              child: Text('Total Pembayaran')
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: 150,
                              child: Text('Rp '+formatter.format(omp.totalPrice).replaceAll(',', '.'),
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Text('PILIH PEMBAYARAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ) : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
