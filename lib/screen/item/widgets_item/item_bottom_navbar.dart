import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/cart_manager.dart';
import '../../../model/product.dart';

class ItemBottomNavbar extends StatelessWidget {
  final ProductModel product;

  const ItemBottomNavbar({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0,right: 12), // Khoảng cách giữa giá tiền và nút "Thêm vào giỏ hàng"
                  child: Text(
                    "${NumberFormat('###,###.###').format(product.price ?? 0)}đ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<CartManager>().addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đã thêm sản phẩm vào giỏ hàng')),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Thêm vào giỏ hàng",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.only(left: 15,right: 15), // Điều chỉnh khoảng cách bên trong của nút
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}