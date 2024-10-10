import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../model/product.dart';

class ItemsStore extends StatefulWidget {
  final List<ProductModel> products;

  const ItemsStore({super.key, required this.products});


  @override
  _ItemsStoreState createState() => _ItemsStoreState();
}

class _ItemsStoreState extends State<ItemsStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: GridView.builder(
        itemCount: widget.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.68,
          crossAxisCount: 2,
        ),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildProductItem(widget.products[index]);
        },
      ),
    );
  }

  Widget _buildProductItem(ProductModel product) {
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
      'itemPage',
      arguments: product,
    );
  },
  child: Container(
    margin: EdgeInsets.all(10),
    child: Image.asset(
      "${product.img}",
      height: 80,
      width: 80,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.error);
      },
    ),
  ),
),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              product.name ?? 'Không có tên',
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
              product.des ?? 'Không có mô tả',
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
                  "${NumberFormat('###,###.###').format(product.price ?? 0)}đ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}