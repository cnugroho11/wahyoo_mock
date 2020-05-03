import 'package:flutter/material.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:WahyooMock/constants/url_api.dart' as url;

enum OrderMenuState {init, none, loading, error}
class OrderMenuProvider with ChangeNotifier{


  OrderMenuProvider(){
    print('prvider jalan');
    getAllProducts();
  }

  OrderMenuState _state = OrderMenuState.init;
  OrderMenuState get state => _state;
  List<Product> _allProducts = List();
  List<Product> get allProducts => _allProducts;
  int quantityInCart = 0;
  double totalPrice = 0;


  _changeState(OrderMenuState s){
    _state = s;
    notifyListeners();
  }

  getAllProducts() async {
    _changeState(OrderMenuState.loading);
    var result = await http.get(url.getProductAll + "2");
    print(result.statusCode);
    if(result.statusCode == 200){
      _allProducts = (json.decode(result.body)['data'] as List).map((a) => Product.fromJson(a)).toList();
      print(_allProducts.length);
      _changeState(OrderMenuState.none);
    }else{
      print(result.statusCode);
      _changeState(OrderMenuState.error);
      throw 'error';
    }
  }

  addProduct(Product p){
    if(p.quantity != 99){
      p.quantity++;
      quantityInCart++;
      totalPrice += p.priceFinal;
    }
    notifyListeners();
  }

  decreaseProduct(Product p){
    if(p.quantity != 0){
      p.quantity--;
      quantityInCart--;
      totalPrice -= p.priceFinal;
    }
    notifyListeners();
  }

  clearProduct(Product p){
    if(p.quantity != 0){
      quantityInCart -= p.quantity;
      totalPrice -= p.quantity * p.priceFinal;
      p.quantity = 0;
    }
    notifyListeners();
  }

}