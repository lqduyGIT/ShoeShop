import 'package:flutter/widgets.dart';
import 'product.dart';

class ProductsVM with ChangeNotifier{
  List<ProductModel> lst = [];
  //thêm 1 item vào danh sách
  add(ProductModel mo){
    lst.add(mo);
    notifyListeners();
  }

  //xóa vị trí
  del(int index){
    lst.removeAt(index);
    notifyListeners();
  }
}