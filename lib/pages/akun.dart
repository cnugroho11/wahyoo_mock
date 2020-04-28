import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:WahyooMock/pages/voucher_page.dart';
import 'package:WahyooMock/pages/about_page.dart';
import 'package:WahyooMock/pages/notification_page.dart';
import 'package:WahyooMock/pages/address_page.dart';
import 'package:WahyooMock/pages/help_page.dart';
import 'package:WahyooMock/pages/pesanan.dart';
import 'package:WahyooMock/widgets/appbar.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Akun Saya',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      child: Text(
                        'CN',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Cahyo Nugroho'),
                      Text('+6281xxxxxx')
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 20,
              color: Colors.black12,
            ),
            Container(
              height: 60,
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationPage()
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Pemberitahuan'),
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
                  onPressed: ()  => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddressPage()
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Alamat Saya'),
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Pesanan()
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Pesanan Saya'),
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VoucherPage()
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Voucher Saya'),
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AboutPage()
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Tentang Kami'),
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HelpPage()
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text('Pusat Bantuan'),
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
                        child: Text(
                          'Keluar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 17, left: 10),
              height: 50,
              width: 600,
              decoration: BoxDecoration(
                color: Colors.black12
              ),
              child: Text('v2.10.1'),
            ),
          ],
        ),
      ),
    );
  }
}
