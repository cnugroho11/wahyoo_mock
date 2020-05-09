
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
          color: Colors.red,
          height: 200,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: omp.allCategoryNames.length,
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductByCategoryScreen(
                              omp.allCategoryNames[i]))),
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Card(
                          child: Text(omp.allCategoryNames[i]),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}