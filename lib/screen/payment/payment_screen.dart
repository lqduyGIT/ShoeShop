import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/cart_manager.dart';
import 'widgets_payment/payment_app_bar.dart';
import 'widgets_payment/payment_bottom_navbar.dart';
import 'widgets_payment/payment_item_sample.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartManager = Provider.of<CartManager>(context);
    final totalAmount = cartManager.totalAmount;
    final taxAmount = totalAmount * 0.1;
    final finalTotal = totalAmount + taxAmount;

    return Scaffold(
      body: Column(
        children: [
          PaymentAppBar(), // Thanh công cụ trên cùng của trang giỏ hàng
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 15), // Khoảng cách trên
              decoration: const BoxDecoration(
                color: Color(0xFFEDECF2), // Màu nền của phần chứa giỏ hàng
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), // Bo góc phần trên bên trái
                  topRight: Radius.circular(35), // Bo góc phần trên bên phải
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PaymentItemSample(), // Widget hiển thị các mặt hàng trong giỏ hàng
                    // Mã giảm giá
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Màu của viền khung
                          width: 1, // Độ dày của viền khung
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Nhập mã giảm giá",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // Nút Áp dụng với viền và màu nền đen, chữ trắng
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black, // Màu nền đen
                              borderRadius:
                                  BorderRadius.circular(20), // Bo góc của nút
                              border: Border.all(
                                color: Colors.grey, // Màu của viền nút
                                width: 1, // Độ dày của viền nút
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Xử lý khi nhấn vào nút "Áp dụng"
                              },
                              child: const Text(
                                "Áp dụng",
                                style: TextStyle(
                                  color: Colors.white, // Chữ màu trắng
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Khung viền bao quanh nội dung thanh toán
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Màu của viền khung
                          width: 1, // Độ dày của viền khung
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nội dung chi tiết đơn hàng
                          Padding(
                            padding: const EdgeInsets.only(bottom: 26.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Tổng tiền hàng:'),
                                    Text("${NumberFormat('###,###').format(totalAmount)}đ"),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Phí vận chuyển:'),
                                    const Text(
                                      'Free',
                                      style: TextStyle(
                                        color: Colors.red, // Màu chữ đỏ
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Phí thuế:'),
                                    Text("${NumberFormat('###,###').format(taxAmount)}đ"),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Tổng đơn hàng:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${NumberFormat('###,###').format(finalTotal)}đ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Color(0xFF939393)),
                          // Phương thức thanh toán
                          Padding(
                            padding: const EdgeInsets.only(bottom: 26.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Phương thức thanh toán',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'Thay đổi',
                                      style:
                                          TextStyle(color: Color(0xFF4B68FF)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/momo.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Momo',
                                      style: TextStyle(
                                        color: Color.fromRGBO(233, 30, 99, 1), 
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Địa chỉ giao hàng
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Địa chỉ giao hàng',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'Thay đổi',
                                      style:
                                          TextStyle(color: Color(0xFF4B68FF)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Text('Duy Huy'),
                                const SizedBox(height: 3),
                                const Text(
                                    '0123456789'),
                                const Text(
                                    'Lê Thiệt, Phú Thọ Hòa, Tân Phú, Tp. Hồ Chí Minh'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: PaymentBottomNavBar(totalAmount: finalTotal),
    );
  }
}
