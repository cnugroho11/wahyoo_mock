import 'package:WahyooMock/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/pages/product_detail.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:intl/intl.dart';

class HorizontalListProvider extends StatelessWidget {
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
              ? Container(
                  height: 350,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return HorizontalCard(
                        product: omp.allProducts[i],
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    'wew',
                  ),
                ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final Product product;

  HorizontalCard({this.product});

  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(url.ftp + product.image),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 10,),
            Container(
              width: 170,
              child: Text(product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              width: 170,
              child: Text(product.id.toString() + ' / Pcs'),
            ),
            SizedBox(height: 10,),
            Container(
              width: 170,
              child: Text(
                  'Rp '+formatter.format(product.priceBase).replaceAll(',', '.'),
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Center(
                  child: Text(
                    'BELI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
