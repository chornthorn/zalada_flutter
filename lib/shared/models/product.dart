class Product {
  final String name;
  final double originalPrice;
  final double salePrice;
  final String imageUrl;
  final double rating;
  final int ratingCount;
  final int soldCount;
  final String discount;

  const Product({
    required this.name,
    required this.originalPrice,
    required this.salePrice,
    required this.imageUrl,
    required this.rating,
    required this.ratingCount,
    required this.soldCount,
    required this.discount,
  });

  static List<Product> products = [
    Product(
      name: 'Macbook Pro 2021, 16GB RAM, 512GB SSD',
      originalPrice: 100,
      salePrice: 80,
      imageUrl: 'https://picsum.photos/250?image=9',
      rating: 4.5,
      ratingCount: 100,
      soldCount: 10,
      discount: '20%',
    ),
    Product(
      name: 'Dell XPS 15, 16GB RAM, 512GB SSD',
      originalPrice: 100,
      salePrice: 80,
      imageUrl: 'https://picsum.photos/250?image=9',
      rating: 4.5,
      ratingCount: 100,
      soldCount: 20,
      discount: '20%',
    ),
    Product(
      name: 'HP Spectre x360, 16GB RAM, 512GB SSD',
      originalPrice: 100,
      salePrice: 80,
      imageUrl: 'https://picsum.photos/250?image=9',
      rating: 4.5,
      ratingCount: 100,
      soldCount: 22,
      discount: '20%',
    ),
    Product(
      name: 'Macbook Air 2021, 16GB RAM, 512GB SSD',
      originalPrice: 100,
      salePrice: 80,
      imageUrl: 'https://picsum.photos/250?image=9',
      rating: 4.5,
      ratingCount: 100,
      soldCount: 32,
      discount: '20%',
    ),
    Product(
      name: 'Product 5',
      originalPrice: 100,
      salePrice: 80,
      imageUrl: 'https://picsum.photos/250?image=9',
      rating: 4.5,
      ratingCount: 100,
      soldCount: 64,
      discount: '20%',
    ),
  ];
}