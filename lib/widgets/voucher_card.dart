import 'package:flutter/material.dart';
import 'package:WahyooMock/pages/voucher_page.dart';

class VoucherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 210,
            child: Text(
              'Anda Punya 2 Voucher',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.green
              ),
            ),
          ),
          GestureDetector(
            onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VoucherPage()
            )),
            child: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.green,
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
    );
  }
}
