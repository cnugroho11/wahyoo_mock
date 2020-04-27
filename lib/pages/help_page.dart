import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
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
          'Pusat Bantuan',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        actions: <Widget>[
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
            Container(
              height: 60,
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Pertanyaan Umum'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.amber,
                        size: 15,
                      )
                    ],
                  )),
            ),
            Container(
              height: 1,
              width: 370,
              decoration: BoxDecoration(color: Colors.black12),
            ),
            Container(
              height: 60,
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Bicara dengan Customer Service'),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.amber,
                        size: 15,
                      )
                    ],
                  )),
            ),
            Container(
              height: 1,
              width: 370,
              decoration: BoxDecoration(color: Colors.black12),
            ),
          ],
        ),
      ),
    );
  }
}
