import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/pages/product_detail.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:intl/intl.dart';

class ProductCardProvider extends StatelessWidget {
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
        itemCount: 5,
        itemBuilder: (context, i) {
          return MenuCard(
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


class MenuCard extends StatelessWidget {
  final Product product;
  MenuCard({this.product});
  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 110,
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
                      child: Text(product.id.toString()+' / Pcs',),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Rp. '+formatter.format(product.priceBase).replaceAll(',', '.'),
                            style: TextStyle(
                              color: Colors.green
                            ),
                          ),
                        ),
                        SizedBox(width: 130,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                              child: Text('LIHAT',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
