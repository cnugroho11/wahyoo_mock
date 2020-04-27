import 'package:flutter/material.dart';
import 'package:WahyooMock/widgets/category_card.dart';
import 'package:WahyooMock/pages/help_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 1.0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black54,
        ),
        title: Text(
          'Cari',
          style: TextStyle(fontSize: 15, color: Colors.black),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Container(
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Cari',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              child: Column(
                children: <Widget>[
                  Container(
                      height: 50,
                      width: 300,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kategori Produk',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  Center(
                    child: Container(
                      child: CategoryRow(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
