import 'package:flutter/material.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:intl/intl.dart';
import 'package:WahyooMock/constants/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HorizontalCard extends StatefulWidget {
  @override
  _HorizontalCardState createState() => _HorizontalCardState();
}

class _HorizontalCardState extends State<HorizontalCard> {
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
      height: 350,
      child: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(_berat(snapshot.data[0]));
            return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
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
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  url.ftp+snapshot.data[index]['image']
                                )
                              )
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: 170,
                            child: Text(_name(snapshot.data[index]),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            width: 170,
                            child: Text(
                              _berat(snapshot.data[index]) + " / Pcs"
                            ),
                          ),
                          Container(
                            width: 170,
                            height: 30,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                "Rp. " + _final_price(snapshot.data[index]),
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 15
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
                          ),
                        ],
                      ),
                    ),
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
