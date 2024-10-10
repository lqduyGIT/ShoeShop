import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../model/product.dart';

class ItemsWidget extends StatefulWidget {
  final List<ProductModel> products;

  const ItemsWidget({super.key, required this.products});

  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: widget.products.map((product) => buildProductItem(context, product)).toList(),
    );
  }

  Widget buildProductItem(BuildContext context, ProductModel product) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "-25%",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/itemPage',
                arguments: product,
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                "${product.img}", // Sử dụng hình ảnh từ product.img
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              product.name ?? "Tên Sản Phẩm", // Hiển thị tên sản phẩm
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              product.des ?? "Thông tin sản phẩm", // Hiển thị mô tả sản phẩm
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${NumberFormat('###,###.###').format(product.price)}\đ", // Hiển thị giá sản phẩm
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
