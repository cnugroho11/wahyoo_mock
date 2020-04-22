import 'package:WahyooMock/widgets/category_card.dart';
import 'package:WahyooMock/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/voucher_card.dart';
import 'package:WahyooMock/widgets/horizontal_list_card.dart';

class Belanja extends StatefulWidget {

  @override
  _BelanjaState createState() => _BelanjaState();
}

class _BelanjaState extends State<Belanja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: (){},
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
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.contact_phone,
              color: Colors.black54,
            ),
          ),
        ],
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
            CategoryRow(),
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
            MenuCard(),
            Container(
              child: GestureDetector(
                onTap: (){},
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
                  Container(
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

                ],
              ),
            ),
            Container(
              child: HorizontalCard(),
            )
          ],
        ),
      )
    );
  }
}
