import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/pages/product_by_category.dart';
import 'package:WahyooMock/models/category_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryRowProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderMenuProvider>(
      builder: (_, omp, a) {
        return Container(
          height: 280,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: omp.categoryNames.length - 1,
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductByCategoryScreen(
                              omp.allCategoryNames[i]))),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(url.ftp + omp.categoryImages[i]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      child: Text(
                        omp.categoryNames[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    )
                  ],
                );
              }),
        );
      },
    );
  }
}
