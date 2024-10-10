import 'package:flutter/material.dart'; // Nhập gói Flutter
import 'package:hd_shoesshop/data/onboarding_items.dart'; // Nhập dữ liệu onboarding
import 'package:hd_shoesshop/screen/widgets_onboarding/onboarding_template.dart'; // Nhập ContentTemplate

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedIndex = 0; // Chỉ số trang hiện tại
  late PageController controller; // Controller cho PageView

  @override
  void initState() {
    // Khởi tạo PageController với trang bắt đầu là 0
    controller =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    // Giải phóng tài nguyên của PageController khi không còn sử dụng
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Lấy kích thước màn hình

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Màu nền của AppBar
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, '/login'); // Chuyển đến màn hình chính
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1), // Viền đen với độ dày 2
                borderRadius: BorderRadius.circular(8), // Bo góc viền
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black, // Màu chữ của nút Skip
                  decoration: TextDecoration.underline, // Thêm dấu gạch chân cho chữ Skip
                  decorationColor: Colors.black, // Màu của dấu gạch chân
                  decorationThickness: 2, // Độ dày của dấu gạch chân
                ),
              ),
            ),
          ),
          const SizedBox(width: 20), // Khoảng cách bên phải nút Skip
        ],
      ),

      body: Container(
        color: Colors.white, // Màu nền của màn hình
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(
            horizontal: 20), // Padding hai bên màn hình
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnboardingItems
                    .onBoardItemList.length, // Số lượng trang dựa trên dữ liệu
                controller: controller, // Controller cho PageView
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index; // Cập nhật chỉ số trang khi thay đổi
                  });
                },
                itemBuilder: (context, index) {
                  final item = OnboardingItems
                      .onBoardItemList[index]; // Lấy dữ liệu của trang hiện tại
                  return ContentTemplate(
                    item: item, // Sử dụng ContentTemplate để hiển thị nội dung
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Căn chỉnh các thành phần trong hàng
              children: [
                Row(
                  children: List.generate(
                    OnboardingItems.onBoardItemList
                        .length, // Số lượng dots dựa trên dữ liệu
                    (index) => AnimatedContainer(
                      duration: const Duration(
                          milliseconds: 500), // Thời gian chuyển động
                      height: 6,
                      width: selectedIndex == index
                          ? 50
                          : 10, // Kích thước dot thay đổi khi chọn
                      margin: const EdgeInsets.only(
                          right: 8), // Khoảng cách giữa các dots
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.grey, // Màu của dot hiện tại và khác
                        borderRadius:
                            BorderRadius.circular(8), // Bo góc cho dot
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedIndex <
                        OnboardingItems.onBoardItemList.length - 1) {
                      // Nếu không phải trang cuối cùng, chuyển đến trang tiếp theo
                      controller.animateToPage(selectedIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    } else {
                      // Nếu là trang cuối cùng, chuyển đến màn hình chính
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 42, 42), // Màu nền của nút
                      shape: BoxShape.circle, // Hình dạng của nút là hình tròn
                      border: Border.all(
                        color: Colors.blueAccent, // Màu viền của nút
                        width: 2, // Độ dày của viền
                      ),
                    ),
                    child: Center(
                      child: selectedIndex !=
                              OnboardingItems.onBoardItemList.length - 1
                          ? const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 30,
                              color: Colors.white, // Màu icon
                            )
                          : Text(
                              "Start",
                              style: TextStyle(
                                color: Colors.white, // Màu chữ "Start"
                                fontWeight:
                                    FontWeight.bold, // Đậm cho chữ "Start"
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: size.height *
                    0.15), // Khoảng cách bên dưới để tạo không gian
          ],
        ),
      ),
    );
  }
}
