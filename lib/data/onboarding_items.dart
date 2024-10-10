import 'onboarding_data.dart'; // Import lớp OnBoardItems để sử dụng

// Lớp cung cấp dữ liệu giả cho onboarding
class OnboardingItems {
  // Danh sách các mục onboarding sử dụng dữ liệu giả
  static List<OnBoardData> onBoardItemList = [
    OnBoardData(
      image: 'assets/gif/gif11.gif', // Đường dẫn đến hình ảnh GIF đầu tiên
      title: "CHÀO MỪNG BẠN", // Tiêu đề cho mục onboarding đầu tiên
      shortDescription: // Mô tả ngắn gọn cho mục onboarding đầu tiên
          "Với chúng tôi, mỗi đôi giày đều là một tác phẩm nghệ thuật. Hãy cùng khám phá và trải nghiệm!",
    ),
    OnBoardData(
      image: 'assets/gif/gif14.gif', // Đường dẫn đến hình ảnh GIF thứ hai
      title: "LỰA CHỌN HOÀN HẢO", // Tiêu đề cho mục onboarding thứ hai
      shortDescription: // Mô tả ngắn gọn cho mục onboarding thứ hai
          "Hãy để chúng tôi giúp bạn tạo nên một phong cách riêng với đôi sneaker độc đáo.",
    ),
    OnBoardData(
      image: 'assets/gif/gif13.gif', // Đường dẫn đến hình ảnh GIF thứ ba
      title: "KẾT NỐI VỚI ĐAM MÊ", // Tiêu đề cho mục onboarding thứ ba
      shortDescription: // Mô tả ngắn gọn cho mục onboarding thứ ba
          "Sneaker không chỉ là giày, đó là niềm đam mê, là cá tính, là bạn đồng hành trên mọi nẻo đường.",
    ),
  ];
}
