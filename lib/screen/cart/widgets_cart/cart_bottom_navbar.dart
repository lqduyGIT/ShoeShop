import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/cart_manager.dart';
import '../../payment/payment_screen.dart';

// Widget hiển thị thanh điều hướng dưới cùng của trang giỏ hàng
class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy tổng số tiền từ CartManager
    final totalAmount = context.watch<CartManager>().totalAmount;

    return BottomAppBar(
      color: Colors.white, // Màu nền của thanh điều hướng dưới cùng
      height: 130, // Chiều cao của thanh điều hướng
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử dọc
          children: [
            // Hiển thị tổng thanh toán
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử ngang
              children: [
                const Text(
                  "Tổng thanh toán:", // Văn bản hiển thị tổng thanh toán
                  style: TextStyle(
                    color: Colors.black, // Màu chữ
                    fontSize: 20, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                  ),
                ),
                Text(
                  "${NumberFormat('###,###').format(totalAmount)}đ", // Hiển thị tổng số tiền thanh toán với định dạng
                  style: const TextStyle(
                    fontSize: 25, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.black, // Màu chữ
                  ),
                ),
              ],
            ),
            // Nút thanh toán
            InkWell(
              onTap: () {
                // Điều hướng đến trang thanh toán
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(), // Thay PaymentPage() bằng widget trang thanh toán của bạn
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center, // Căn giữa nội dung của container
                height: 50, // Chiều cao của nút thanh toán
                width: double.infinity, // Độ rộng đầy đủ của container
                decoration: BoxDecoration(
                  color: Colors.black, // Màu nền của nút
                  borderRadius: BorderRadius.circular(20), // Bo góc của nút
                ),
                child: const Text(
                  "Thanh toán", // Văn bản hiển thị trên nút thanh toán
                  style: TextStyle(
                    fontSize: 16, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.white, // Màu chữ
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
