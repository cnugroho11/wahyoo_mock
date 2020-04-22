import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryRow extends StatefulWidget {
  @override
  _CategoryRowState createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //air meneral
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.wineBottle,
                color: Colors.green,
              )),
            ),
            //aneka tepung
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.breadSlice,
                color: Colors.orange,
              )),
            ),
            //beras
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.cheese,
                color: Colors.orange,
              )),
            ),
            //biscuit & snack
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.cookieBite,
                color: Colors.orange,
              )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 55,
              child: Text(
                'Air Mineral',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            Container(
              width: 55,
              child: Text(
                'Aneka Tepung',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            Container(
              width: 55,
              child: Text(
                'Beras',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            Container(
              width: 55,
              child: Text(
                'Biscuit & Snack',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //buah & sayur
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.appleAlt,
                color: Colors.orange,
              )),
            ),
            //bumbu dapur
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.pepperHot,
                color: Colors.green,
              )),
            ),
            //Cereal & bubur
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.egg,
                color: Colors.orange,
              )),
            ),
            //Semua Kategori
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.list,
                color: Colors.green,
              )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 55,
              child: Text(
                'Buah & Sayur',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            Container(
              width: 55,
              child: Text(
                'Bumbu Dapur',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            Container(
              width: 55,
              child: Text(
                'Cereal & Bubur',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            Container(
              width: 55,
              child: Text(
                'Semua Kategori',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
