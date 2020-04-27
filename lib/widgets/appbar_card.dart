import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';

class AppBarCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final omp = Provider.of<OrderMenuProvider>(context);
    return Container(
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black54,
                ),
              ),
              (omp.quantityInCart == 0)?Container():CircleAvatar(
                minRadius: 10,
                child: Text(omp.quantityInCart.toString(), style: TextStyle(color: Colors.white, fontSize: 15),),
              )
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.contact_phone,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}