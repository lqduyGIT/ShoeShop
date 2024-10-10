// Import các gói thư viện cần thiết
import 'package:firebase_core/firebase_core.dart'; // Dùng để khởi tạo Firebase trong ứng dụng.
import 'package:flutter/material.dart'; // Gói Flutter cơ bản để xây dựng giao diện người dùng.
import 'package:hd_shoesshop/screen/cart/cart_page.dart'; // Import màn hình giỏ hàng.
import 'package:hd_shoesshop/screen/home/home_screen.dart'; // Import màn hình chính (home screen).
import 'package:get/get.dart'; // Gói GetX dùng để quản lý trạng thái và điều hướng (routing).
import 'package:hd_shoesshop/screen/login/login_screen.dart'; // Import màn hình đăng nhập.
import 'package:provider/provider.dart'; // Gói Provider dùng để quản lý trạng thái.
import 'model/UserInfoProvider.dart'; // Import lớp cung cấp thông tin người dùng.
import 'model/cart_manager.dart'; // Import lớp quản lý giỏ hàng.
import 'model/product_viewmodel.dart'; // Import lớp quản lý sản phẩm.
import 'screen/item/item_page.dart'; // Import màn hình chi tiết sản phẩm.
import 'screen/onboarding_screen.dart'; // Import màn hình giới thiệu ban đầu (onboarding).
import 'screen/splash_screen.dart'; // Import màn hình splash (khởi đầu).

// Hàm main() là điểm bắt đầu của ứng dụng.
void main() async {
  // WidgetsFlutterBinding.ensureInitialized() được gọi để đảm bảo rằng tất cả các widget được khởi tạo trước khi chạy ứng dụng.
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase. Hàm này cần gọi trong async/await vì Firebase có thể mất thời gian để khởi tạo.
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // Nếu xảy ra lỗi trong quá trình khởi tạo Firebase, thông báo lỗi sẽ được in ra console.
    print('Firebase initialization failed: $e');
  }

  // Khởi chạy ứng dụng chính.
  runApp(const MainApp());
}

// MainApp là widget chính của ứng dụng.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Đăng ký các lớp Provider để quản lý trạng thái toàn cục.
        ChangeNotifierProvider(create: (context) => UserInfoProvider()), // Quản lý thông tin người dùng.
        ChangeNotifierProvider(create: (context) => ProductsVM()), // Quản lý sản phẩm.
        ChangeNotifierProvider(create: (context) => CartManager()), // Quản lý giỏ hàng.
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false, // Tắt banner "Debug" trên góc màn hình.
        initialRoute: '/', // Định nghĩa route ban đầu khi ứng dụng chạy.
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()), // Route cho màn hình splash.
          GetPage(name: '/onboarding', page: () => OnboardingScreen()), // Route cho màn hình onboarding.
          GetPage(name: '/login', page: () => LoginScreen()), // Route cho màn hình đăng nhập.
          GetPage(name: '/cartPage', page: () => CartPage()), // Route cho màn hình giỏ hàng.
          GetPage(name: '/itemPage', page: () => ItemPage()), // Route cho màn hình chi tiết sản phẩm.
          // Các route khác có thể thêm vào đây khi cần.
        ],
      ),
    );
  }
}
