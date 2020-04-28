import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.white;
  final Widget title;
  final AppBar appBar;
  final List<Widget> widgets;

  const AppbarWidget({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final omp = Provider.of<OrderMenuProvider>(context);
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black54),
      bottomOpacity: 0,
      elevation: 1.0,
      title: title,
      backgroundColor: backgroundColor,
      actions: <Widget>[
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black54,
                ),
              ),
            ),
            (omp.quantityInCart == 0)
                ? Container()
                : Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 40,
                      width: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        minRadius: 8,
                        child: Text(
                          omp.quantityInCart.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.contact_phone,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
