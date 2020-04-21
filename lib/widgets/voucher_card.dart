import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          color: Colors.greenAccent,
        ),
        child: Center(
            child: Text(
                'Anda Punya 2 Voucher',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green
              ),
            )
        ),
      ),
    );
  }
}
