import 'dart:convert'; // Import thư viện để sử dụng JSON encoding/decoding

// Lớp đại diện cho thông tin onboarding
class OnBoardData {
  final String image; // Đường dẫn đến hình ảnh của item
  final String title; // Tiêu đề của item
  final String shortDescription; // Mô tả ngắn gọn của item

  // Constructor yêu cầu ba tham số: image, title, và shortDescription
  OnBoardData({
    required this.image,
    required this.title,
    required this.shortDescription,
  });

  // Tạo bản đồ (map) từ đối tượng OnBoardItems
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'shortDescription': shortDescription,
    };
  }

  // Tạo đối tượng OnBoardItems từ bản đồ (map)
  factory OnBoardData.fromMap(Map<String, dynamic> map) {
    return OnBoardData(
      image: map['image'],
      title: map['title'],
      shortDescription: map['shortDescription'],
    );
  }

  // Chuyển đổi đối tượng thành chuỗi JSON
  String toJson() => json.encode(toMap());

  // Tạo đối tượng từ chuỗi JSON
  factory OnBoardData.fromJson(String source) =>
      OnBoardData.fromMap(json.decode(source));
}
