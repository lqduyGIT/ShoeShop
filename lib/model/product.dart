import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? des;
  int? catID;
  String? catName;

  //constructor
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.des,
    this.catID,
    this.catName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'des': des,
      'catID': catID,
      'catName': catName,
    };
  }

  ProductModel.fromJson(Map<String,dynamic> json){
    id = json["id"];
    name = json["name"];
    price = json["price"];
    img = json["img"];
    des = json["des"];
    catID = json["catID"];
    catName = json["catName"];
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      img: map['img'] != null ? map['img'] as String : null,
      des: map['des'] != null ? map['des'] as String : null,
      catID: map['catID'] != null ? map['catID'] as int : null,
      catName: map['catName'] != null ? map['catName'] as String : null,
    );
  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic>data=<String, dynamic>{};
    data["id"]=id;
    data["name"]=name;
    data["price"]=price;
    data["img"]=img;
    data["des"]=des;
    data["catID"]=catID;
    data["catName"]=catName;
    return data;
  }
}
