import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:WahyooMock/providers/order_menu_providers.dart';
import 'package:WahyooMock/models/category_model.dart';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryRowProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderMenuProvider>(
      builder: (_,omp,a){
        return Container(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Pilih Category'),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: omp.categoryNames.length,
                  itemBuilder: (context, i){
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 13,vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(omp.allCategoryNames[i],style: TextStyle(color: Colors.black)),
                            Text(omp.products.where((a) => a.categoryName == omp.categoryNames[i]).length.toString(),style: TextStyle(color: Colors.black),),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}
