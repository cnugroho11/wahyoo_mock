import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
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
          'Voucher Anda',
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Center(
                child: Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 190,
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/voucher.png'),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 290,
                          child: Text(
                            'Voucher Menuju Berkah',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                        color: Colors.black12
                                    ),
                                    child: Text(
                                        'Kode Voucher : BERKAH',
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                        'Minimum Belanja Rp. 500.000',
                                    ),
                                    alignment: Alignment.centerLeft,
                                    width: 200,
                                  ),
                                  Container(
                                    child: Text(
                                        'Berlaku hingga 30 April 2020'
                                    ),
                                    alignment: Alignment.centerLeft,
                                    width: 200,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                      child: Text(
                                        'LIHAT',
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
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
