class Product{
  int id;
  int shopId;
  int outletId;
  int categoriesId;
  String name;
  String description;
  int priceBase;
  int priceFinal;
  int pricePerItem;
  int pricePerKilo;
  int point;
  bool isAvailable;
  bool isBookable;
  bool isDeliverable;
  bool isTodayPick;
  bool isBestSeller;
  String image;
  String categoryName;

  int quantity = 0;
  String note = '';

  Product({
    this.id, this.point,
    this.shopId, this.isAvailable,
    this.outletId, this.isBookable,
    this.categoriesId, this.isDeliverable,
    this.name, this.isTodayPick,
    this.description, this.isBestSeller,
    this.priceBase,this.image,
    this.priceFinal, this.categoryName,
    this.pricePerItem,
    this.pricePerKilo,
  });

  factory Product.fromJson(Map<String, dynamic>json){
    return Product(
      id: json['id'],
      shopId: json['shop_id'],
      outletId: json['outlet_id'],
      categoriesId: json['categories_id'],
      name: json['product_name'],
      description: json['product_description'],
      priceBase: json['base_price'],
      priceFinal: json['final_price'],
      pricePerItem: json['price_per_item'],
      pricePerKilo: json['price_per_kilo'],
      point: json['point'],
      isAvailable: json['is_available'] != 0,
      isBookable: json['is_bookable'] != 0,
      isDeliverable: json['is_deliverable'] != 0,
      isTodayPick: json['is_todaypick'] != 0,
      isBestSeller: json['is_bestseller'] != 0,
      image: json['image'],
      categoryName: (json.containsKey('categories'))?(json['categories'] != null)?json['categories']['name']:'no category':'no category',
    );
  }
}