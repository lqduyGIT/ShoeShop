import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/cart_manager.dart';

class CartItemSamples extends StatelessWidget {
  const CartItemSamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context);
    return Column(
      children: [
        for (var cartItem in cartManager.items)
          Container(
            height: 130, // Tăng chiều cao để tránh tràn
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset("${cartItem.product.img}"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartItem.product.name ?? "Tên Sản Phẩm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        cartItem.product.des ?? "Mô tả",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${NumberFormat('###,###.###').format(cartItem.product.price)}đ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cartManager.removeItem(cartItem.product);
                        },
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 0, right: 0), // Loại bỏ padding
                            child: IconButton(
                              icon: Icon(CupertinoIcons.minus, size: 16, color: Colors.black),
                              constraints: BoxConstraints(), // Loại bỏ ràng buộc mặc định của IconButton
                              padding: EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
                              onPressed: () {
                                if (cartItem.quantity > 1) {
                                  cartManager.updateQuantity(cartItem.product, cartItem.quantity - 1);
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: 17, // Đặt kích thước cố định cho số lượng
                              child: Text(
                                "${cartItem.quantity}",
                                textAlign: TextAlign.center, // Căn giữa số lượng trong khung
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0, right: 0), // Loại bỏ padding
                            child: IconButton(
                              icon: Icon(CupertinoIcons.plus, size: 16, color: Colors.black),
                              constraints: BoxConstraints(), // Loại bỏ ràng buộc mặc định của IconButton
                              padding: EdgeInsets.zero, // Loại bỏ padding mặc định của IconButton
                              onPressed: () {
                                cartManager.updateQuantity(cartItem.product, cartItem.quantity + 1);
                              },
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
