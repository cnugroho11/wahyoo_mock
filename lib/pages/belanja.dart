import 'package:WahyooMock/pages/all_product.dart';
import 'package:WahyooMock/pages/all_favourite.dart';
import 'package:WahyooMock/widgets/category_card.dart';
import 'package:WahyooMock/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/voucher_card.dart';
import 'package:WahyooMock/widgets/horizontal_list_card.dart';
import 'package:WahyooMock/pages/search_page.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:WahyooMock/widgets/appbar.dart';
import 'package:WahyooMock/pages/product_by_category_screen.dart';


class Belanja extends StatefulWidget {

  @override
  _BelanjaState createState() => _BelanjaState();
}

class _BelanjaState extends State<Belanja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductByCategoryScreen('espresso-based')
          )),
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  color: Colors.black12,
                ),
                Text(
                  'Cari Produk',
                  style: TextStyle(fontSize: 15, color: Colors.black12),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(),
      ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15,),
            Center(
              child: VoucherCard(),
            ),
            Container(
              height: 50,
              width: 350,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
              ),
              child: Text(
                'Kategori Produk',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 300,
                height: 200,
                child: CategoryRowProvider()
            ),
            Container(
              height: 50,
              width: 350,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
              ),
              child: Text(
                'Produk Favorit',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            ProductCardProvider(),
            Container(
              child: GestureDetector(
                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllFavourite()
                )),
                child: Center(
                  child: Text(
                    'Lihat Semua Produk Favorit',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                    ),
                    child: Text(
                      'Daftar Produk',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(width: 185,),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllProduct()
                    )),
                    child: Container(
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalListProvider()
          ],
        ),
      )
    );
  }
}
