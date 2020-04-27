import 'package:flutter/material.dart';
import 'package:WahyooMock/pages/all_favourite.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:intl/intl.dart';
import 'package:WahyooMock/constants/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ProductScroll extends StatefulWidget {
  @override
  _ProductScrollState createState() => _ProductScrollState();
}

class _ProductScrollState extends State<ProductScroll> {

  final formatter = NumberFormat('#,###', 'en_US');

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(url.getProductAll + "2");
    return json.decode(result.body)['data'];
  }

  String _name(dynamic user) {
    return user['product_name'];
  }

  String _final_price(Map<dynamic, dynamic> user) {
    return user['final_price'].toString();
  }

  String _berat(Map<dynamic, dynamic> user) {
    return user['id'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      child:
      FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                //physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 110,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10,),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          url.ftp+snapshot.data[index]['image']
                                      )
                                  )
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
                                Container(
                                  width: 150,
                                  alignment: Alignment.centerLeft,
                                  child: Text(_name(snapshot.data[index]),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  alignment: Alignment.centerLeft,
                                  child: Text(_berat(snapshot.data[index])+" / Pcs",
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 150,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Rp. ' + _final_price(snapshot.data[index]),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.lightGreen
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 50,),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child: Text(
                                      '⊕ TAMBAH',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

