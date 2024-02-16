class CartModel {
  final String imageUrl;
  final String title;
  double price;
  final double originalPrice;
  int quantity;
  bool selected;

  CartModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.selected,
  });
}

final List<CartModel> cartItems = [
  CartModel(
    imageUrl:
        'https://powermaccenter.com/cdn/shop/files/Apple_Watch_Series_9_GPS_45mm_Silver_Aluminum_Storm_Blue_Sport_Band_PDP_Image_Position-1__en-US_8d562dcd-6b02-4975-8a24-26b210107cec_1445x.jpg?v=1699527146',
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    price: 1200,
    originalPrice: 2499,
    quantity: 1,
    selected: true,
  ),
  CartModel(
    imageUrl:
        'https://www.ione.com.kh/wp-content/uploads/2021/05/MacBook-Air-Cambodia.jpg',
    title: 'Macbook Pro 15” 2019 - Intel core i7',
    price: 1399,
    originalPrice: 2499,
    quantity: 1,
    selected: true,
  ),
  CartModel(
    imageUrl:
        'https://powermaccenter.com/cdn/shop/files/Apple_Watch_Series_9_GPS_45mm_Silver_Aluminum_Storm_Blue_Sport_Band_PDP_Image_Position-1__en-US_8d562dcd-6b02-4975-8a24-26b210107cec_1445x.jpg?v=1699527146',
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    price: 1200,
    originalPrice: 2499,
    quantity: 1,
    selected: true,
  ),
];
