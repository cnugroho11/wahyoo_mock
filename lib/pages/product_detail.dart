import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {

  final product_detail_name;
  final product_detail_final_price;
  final product_detail_berat;
  final product_detail_picture;
  final product_detail_stock;

  ProductDetail({
    this.product_detail_name,
    this.product_detail_final_price,
    this.product_detail_berat,
    this.product_detail_picture,
    this.product_detail_stock
});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
          widget.product_detail_name,
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
            onPressed: () {},
            icon: Icon(
              Icons.contact_phone,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Center(
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black12)
              ),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.product_detail_picture),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 350,
            alignment: Alignment.centerLeft,
            child: Text(
              'Stock tersisa '+widget.product_detail_stock+' Pcs',
              style: TextStyle(
                color: Colors.red
              ),
            ),
          ),
          Divider(),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  width: 350,
                  alignment: Alignment.centerLeft,
                  child: Text(widget.product_detail_name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 350,
                  child: Text(widget.product_detail_berat+ ' / Pcs',
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 350,
                  child: Text('Rp. '+widget.product_detail_final_price,
                    style: TextStyle(
                      color: Colors.lightGreen
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
                        child: Text('Jumlah ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
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
                )
              ],
            ),
          ),
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
        )
      ),
    );
  }
}

