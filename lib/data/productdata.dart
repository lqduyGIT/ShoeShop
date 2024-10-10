import '../model/product.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ReadData {
  Future<List<ProductModel>>loadData()async{
    var data = await rootBundle.loadString("assets/files/productlist.json");
    var dataJson = jsonDecode(data);
    return(dataJson["data"] as List).map((e)=>ProductModel.fromJson(e)).toList();
  }
}
