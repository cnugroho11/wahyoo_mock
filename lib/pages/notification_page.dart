import 'package:flutter/material.dart';
import 'package:WahyooMock/pages/help_page.dart';

class NotificationPage extends StatelessWidget {
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
          'Pemberitahuan',
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              width: 400,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 350,
                    child: Text('22 April 2020',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: Text('Anda mendapatkan voucher BERKAH',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 350,
                    child: Text('Belanja pakai voucher sekarang dan dapatkan harga yang lebih murah'),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 350,
                    child: Text('22 Apr 2020, 10:30:11'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.check),
        label: Text("Tandai semua\nsudah dibaca"),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
