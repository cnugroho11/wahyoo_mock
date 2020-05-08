class Category{
  int id;
  int shopId;
  int status;
  String name;
  String image;
  int quantity = 0;

  Category({this.id, this.shopId, this.status, this.name, this.image});

  factory Category.fromJson(Map <String, dynamic> json){
    return Category(
        id: json['id'],
        shopId: json['shop_id'],
        name: json['name'],
        status: json['status'],
        image: json['image']
    );
  }
}