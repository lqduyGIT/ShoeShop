

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hd_shoesshop/data/productdata.dart';
import 'package:hd_shoesshop/product/productcart.dart';

import '../model/product.dart';

class Productlist extends StatefulWidget {
  const Productlist({Key? key}):super(key: key);

  @override
  State<Productlist> createState() => _ProductlistState();
}
class _ProductlistState extends State<Productlist> {
  List<ProductModel> lstProduct=[];

  Future<String> loadProdList() async{
    lstProduct = await ReadData().loadData();
    return '';
  }

  @override
  void initState(){
    super.initState();
    loadProdList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: loadProdList(),
        builder: (BuildContext context,AsyncSnapshot<String> snapshot){
          return GridView.builder(
            itemCount: lstProduct.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return itemGridView(lstProduct[index]);
          });
      }),
      ),
    );
  }
}