import 'package:flutter/material.dart';
import 'package:WahyooMock/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:WahyooMock/constants/url_api.dart' as url;
import 'package:WahyooMock/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum OrderMenuState { init, none, loading, error }

class OrderMenuProvider with ChangeNotifier {

  OrderMenuState _state = OrderMenuState.init;
  OrderMenuState get state => _state;

  List<Product> _allProducts = List();

  List<Product> get allProducts => _allProducts;
  List<Category> _allCategories = List();
  List<Category> _categories = List();
  List<Category> _allImages = List();

  List<Category> get categories => _categories;

  SharedPreferences _sp;

  List<String> categoryImages = [];
  List<String> categoryNames = [];
  List<String> allCategoryNames = [];
  int quantityInCart = 0;
  double totalPrice = 0;

  OrderMenuProvider() {
    print('prvider jalan');
    init();
  }

  init() async {
    await getAllProducts();
    await getAllCategoryNames();
    await getCategories();
    await getAllCategoryImages();
    _getCategoriesForHomeScreen();
  }

  _changeState(OrderMenuState s) {
    _state = s;
    notifyListeners();
  }

  _getCategoriesForHomeScreen() {
    int q = 0;
    for (String s in allCategoryNames) {
      q = _allCategories.where((a) => a.name == s).length;
      Category c = _allCategories.firstWhere((a) => a.name == s);
      c.quantity = q;
      _categories.add(c);
    }
  }

  getAllProducts() async {
    _sp = await SharedPreferences.getInstance();
    _changeState(OrderMenuState.loading);
    var result = await http.get(url.getProductAll + "2");
    print(result.statusCode);
    if (result.statusCode == 200) {
      _allProducts += (json.decode(result.body)['data'] as List)
          .map((a) => Product.fromJson(a))
          .toList();
      _allCategories += (json.decode(result.body)['data'] as List)
          .map((a) => Category.fromJson(a['categories']))
          .toList();
      print(_allProducts.length);
      _changeState(OrderMenuState.none);
    } else {
      print(result.statusCode);
      _changeState(OrderMenuState.error);
      throw 'error';
    }
  }

  getAllCategoryNames() async {
    _sp = await SharedPreferences.getInstance();
    allCategoryNames = [];
    for (Product p in _allProducts) {
      allCategoryNames.add(p.categoryName);
    }
    allCategoryNames = allCategoryNames.toSet().toList();
    print(allCategoryNames);
  }

  getAllCategoryImages() async {
    _sp = await SharedPreferences.getInstance();
    for (Product p in _allProducts){
      categoryImages.add(p.categoryImage);
    }
    categoryImages = categoryImages.toSet().toList();
  }

  getCategories() async {
    categoryNames = [];
    for (Product p in _allProducts) {
      categoryNames.add(p.categoryName);
    }
    categoryNames = categoryNames.toSet().toList();
    print(categoryNames);
  }

  addProduct(Product p) {
    if (p.quantity != 99) {
      p.quantity++;
      quantityInCart++;
      totalPrice += p.priceFinal;
    }
    notifyListeners();
  }

  decreaseProduct(Product p) {
    if (p.quantity != 0) {
      p.quantity--;
      quantityInCart--;
      totalPrice -= p.priceFinal;
    }
    notifyListeners();
  }

  clearProduct(Product p) {
    if (p.quantity != 0) {
      quantityInCart -= p.quantity;
      totalPrice -= p.quantity * p.priceFinal;
      p.quantity = 0;
    }
    notifyListeners();
  }

  clearAllProduct() {
    for (Product p in _allProducts.where((a) => a.quantity != 0)) {
      clearProduct(p);
    }
    notifyListeners();
  }
}
