import 'package:flutter/material.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:WahyooMock/pages/checkout_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FloatingCartButton extends StatelessWidget {
  final OrderMenuProvider omp;
  final Product product;

  FloatingCartButton({this.product, this.omp});

  final formatter = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return Container(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CheckoutPage())),
        child: Container(
          width: 380,
          height: 70,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Container(
              width: 330,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            'Orders',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            omp.quantityInCart.toString()+' Item(s)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            'Rp ' +
                                formatter
                                    .format(omp.totalPrice)
                                    .replaceAll(',', '.'),
                            style: TextStyle(
                                color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
