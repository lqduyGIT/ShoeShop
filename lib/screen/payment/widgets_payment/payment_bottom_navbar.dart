import 'package:flutter/material.dart';
import 'package:hd_shoesshop/screen/payment/widgets_payment/payment_success.dart';
import 'package:intl/intl.dart';

class PaymentBottomNavBar extends StatelessWidget {
  final double totalAmount;

  const PaymentBottomNavBar({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white, // Màu nền của thanh điều hướng dưới cùng
      height: 130, // Chiều cao của thanh điều hướng
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding có thể được bật nếu cần
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử dọc
          children: [
            // Hiển thị tổng thanh toán
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử ngang
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
                  "${NumberFormat('###,###').format(totalAmount)}đ", // Tổng số tiền thanh toán
                  style: const TextStyle(
                    fontSize: 25, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.black, // Màu chữ
                  ),
                ),
              ],
            ),

            // Nút thanh toán
            GestureDetector(
              onTap: () {
                // Navigate to the desired widget (e.g., PaymentConfirmationPage)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentSuccess()),
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
