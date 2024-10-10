import 'package:flutter/material.dart';

// Widget để hiển thị danh sách sản phẩm dưới dạng lưới
class ItemsWishlist extends StatelessWidget {
  const ItemsWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        // Sản phẩm 1
        _buildProductItem(
          context,
          imagePath: "assets/images/nike/1.png",
          name: "Nike Air Max",
          description: "Thiết kế hiện đại",
          price: "2,500,000đ",
        ),
        // Sản phẩm 2
        _buildProductItem(
          context,
          imagePath: "assets/images/nike/2.png",
          name: "Nike Air Zoom",
          description: "Nhẹ nhàng, êm ái",
          price: "3,000,000đ",
        ),
        // Sản phẩm 3
        _buildProductItem(
          context,
          imagePath: "assets/images/nike/3.png",
          name: "Nike React",
          description: "Đệm chân êm, bền bỉ",
          price: "2,700,000đ",
        ),
        // Sản phẩm 4
        _buildProductItem(
          context,
          imagePath: "assets/images/nike/4.png",
          name: "Nike Blazer",
          description: "Phong cách cổ điển",
          price: "2,300,000đ",
        ),
      ],
    );
  }

  // Hàm tạo sản phẩm với các tham số khác nhau
  Widget _buildProductItem(
      BuildContext context, {
        required String imagePath,
        required String name,
        required String description,
        required String price,
      }) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "itemPage");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                imagePath,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
