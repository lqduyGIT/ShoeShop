import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/cart_manager.dart';

class PaymentItemSample extends StatelessWidget {
  const PaymentItemSample({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy danh sách các sản phẩm từ CartManager
    final cartManager = Provider.of<CartManager>(context);
    final items = cartManager.items;

    return Column(
      children: [
        // Lặp qua các sản phẩm trong giỏ hàng
        for (var item in items)
          Container(
            height: 110, // Chiều cao của từng mục giỏ hàng
            margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10), // Khoảng cách xung quanh từng mục
            padding: const EdgeInsets.all(10), // Khoảng cách bên trong từng mục
            decoration: BoxDecoration(
              color: Colors.white, // Màu nền của mục giỏ hàng
              borderRadius:
                  BorderRadius.circular(10), // Bo góc của mục giỏ hàng
            ),
            child: Row(
              children: [
                // Hình ảnh sản phẩm
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(
                      right: 15), // Khoảng cách bên phải hình ảnh
                  child: Image.asset("${item.product.img}"),
                ),
                // Thông tin sản phẩm và số lượng
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10), // Khoảng cách dọc bên trong
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Thông tin sản phẩm
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Căn chỉnh văn bản bên trái
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Căn chỉnh các phần tử dọc
                          children: [
                            // Tên sản phẩm
                            Text(
                              item.product.name ?? "Tên Sản Phẩm", // Tên sản phẩm
                              style: const TextStyle(
                                fontSize: 16, // Kích thước chữ
                                fontWeight: FontWeight.bold, // Độ đậm chữ
                                color: Colors.black, // Màu chữ
                              ),
                            ),
                            const SizedBox(
                                height:
                                    1),
                            Text(
                              item.product.des ?? "Tên Sản Phẩm", // Tên sản phẩm
                              style: const TextStyle(
                                fontSize: 14, // Kích thước chữ
                                fontWeight: FontWeight.normal, // Độ đậm chữ
                                color: Colors.black, // Màu chữ
                              ),
                            ), // Khoảng cách giữa tên sản phẩm và nội dung thêm
                            // Nội dung thêm với hiệu ứng mờ
                            // const Opacity(
                            //   opacity: 0.5, // Hiệu ứng mờ
                            //   child: Text(
                            //     item.product.des ?? "Size và mô tả sản phẩm", // Nội dung thêm
                            //     style: TextStyle(
                            //       fontSize: 12, // Kích thước chữ nhỏ hơn
                            //       color: Colors.black, // Màu chữ
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                                height:
                                    1), // Khoảng cách giữa nội dung thêm và giá
                            // Giá sản phẩm
                            Text(
                              "${NumberFormat('###,###.###').format(item.product.price)}đ", // Giá sản phẩm
                              style: const TextStyle(
                                fontSize: 14, // Kích thước chữ
                                fontWeight: FontWeight.bold, // Độ đậm chữ
                                color: Colors.black, // Màu chữ
                              ),
                            ),
                          ],
                        ),
                        // Số lượng sản phẩm
                        Opacity(
                          opacity: 0.5, // Hiệu ứng mờ
                          child: Text(
                            "x${item.quantity}", // Số lượng sản phẩm
                            style: const TextStyle(
                              fontSize: 16, // Kích thước chữ
                              fontWeight: FontWeight.bold, // Độ đậm chữ
                              color: Colors.black, // Màu chữ
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
