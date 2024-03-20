class ProductWishlist {
  final String title;
  final String image;
  final String? status;
  final String? originalPrice;
  final String salePrice;
  final int type;

  ProductWishlist({
    required this.title,
    required this.image,
    this.status,
    this.originalPrice,
    required this.salePrice,
    required this.type,
  });
}

final List<ProductWishlist> productWishlist = [
  ProductWishlist(
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    image:
        'https://powermaccenter.com/cdn/shop/files/Apple_Watch_Series_9_GPS_45mm_Silver_Aluminum_Storm_Blue_Sport_Band_PDP_Image_Position-1__en-US_8d562dcd-6b02-4975-8a24-26b210107cec_1445x.jpg?v=1699527146',
    salePrice: '1200',
    type: 0,
  ),
  ProductWishlist(
    title: 'Macbook Pro 15” 2019 - Intel core i7',
    image:
        'https://www.ione.com.kh/wp-content/uploads/2021/05/MacBook-Air-Cambodia.jpg',
    status: '30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 1,
  ),
  ProductWishlist(
    title: 'Mac Mini 2021 - Intel core i7',
    image:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mac-mini-hero-202301_FMT_WHH?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1671503802341',
    status: 'NEW - 30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    image:
        'https://powermaccenter.com/cdn/shop/files/Apple_Watch_Series_9_GPS_45mm_Midnight_Aluminum_Midnight_Sport_Loop_PDP_Image_Position-1__en-US_1445x.jpg?v=1699526178',
    status: 'NEW - 30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    image:
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MT3D3ref_VW_34FR+watch-case-45-aluminum-midnight-nc-s9_VW_34FR+watch-face-45-aluminum-midnight-s9_VW_34FR_WF_CO?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1694507905569',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'Macbook Pro 15” 2019 - Intel core i7',
    image:
        'https://powermaccenter.com/cdn/shop/files/Apple_Watch_Series_9_GPS_45mm_Silver_Aluminum_Storm_Blue_Sport_Band_PDP_Image_Position-1__en-US_8d562dcd-6b02-4975-8a24-26b210107cec_1445x.jpg?v=1699527146',
    status: 'OUT OF STOCK',
    originalPrice: '1500',
    salePrice: '1200',
    type: 2,
  ),
  ProductWishlist(
    title: 'Iphone 14 Pro 2021 - 128GB',
    image:
        'https://www.iplace.com.br/ccstore/v1/images/?source=/file/v7885850081771667442/products/222256.00-apple-iphone-14-pro-128gb-dourado-mq083be-a.jpg&height=475&width=475',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'Iphone 14 2021 - 128GB',
    image:
        'https://media.cdn.kaufland.de/product-images/2048x2048/26a4fd0d3bdaccf817cffc8ca3f117e5.webp',
    status: 'OUT OF STOCK',
    originalPrice: '1500',
    salePrice: '1200',
    type: 2,
  ),
  ProductWishlist(
    title: 'iMac 27” 2021 - Intel core i7',
    image:
        'https://www.apple.com/newsroom/images/product/imac/standard/Apple_imac-magickeyboardnum-magicmouse2-macos-wallpaper_08042020.jpg.landing-big_2x.jpg',
    status: 'OUT OF STOCK',
    originalPrice: '1500',
    salePrice: '1200',
    type: 2,
  ),
  ProductWishlist(
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    image:
        'https://www.apple.com/v/macbook-air/q/images/meta/macbook-air_overview__fugeevgwjuie_og.png',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
];

final List<ProductWishlist> productWishlistLaptop = [
  ProductWishlist(
    title: 'Macbook Air 2021 - Intel core i7',
    image:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-space-gray-select-201810?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1664472289661',
    salePrice: '1200',
    type: 0,
  ),
  ProductWishlist(
    title: 'Macbook Pro 15” 2019 - Intel core i7',
    image:
        'https://www.ione.com.kh/wp-content/uploads/2021/05/MacBook-Air-Cambodia.jpg',
    status: '30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 1,
  ),
  ProductWishlist(
    title: 'Mac Mini 2021 - Intel core i7',
    image:
        'https://www.apple.com/newsroom/images/product/mac/standard/Apple_MacBook-Pro_14-16-inch_10182021_big.jpg.slideshow-xlarge_2x.jpg',
    status: 'NEW - 30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'Macbook Pro 15” 2019 - Intel core i7',
    image:
        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mac-card-40-macbook-air-202310_FMT_WHH?wid=506&hei=472&fmt=p-jpg&qlt=95&.v=1697562798854',
    status: 'NEW - 30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    image:
        'https://www.apple.com/newsroom/images/live-action/wwdc-2023/standard/macbook-air-15-in/Apple-WWDC23-MacBook-Air-15-in-hero-230605.jpg.news_app_ed.jpg',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'iMac 27” 2021 - Intel core i7',
    image:
        'https://www.apple.com/newsroom/images/product/imac/standard/Apple_imac-magickeyboardnum-magicmouse2-macos-wallpaper_08042020.jpg.landing-big_2x.jpg',
    status: 'OUT OF STOCK',
    originalPrice: '1500',
    salePrice: '1200',
    type: 2,
  ),
  ProductWishlist(
    title: 'iWatches 9 GPS 45mm Silver Aluminum',
    image:
        'https://www.apple.com/v/macbook-air/q/images/meta/macbook-air_overview__fugeevgwjuie_og.png',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
];

final List<ProductWishlist> productWishlistPhone = [
  ProductWishlist(
    title: 'Logetech MX Master 3S Mouse',
    image:
        'https://resource.logitech.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/logitech/en/products/mice/mx-master-3s/gallery/mx-master-3s-mouse-top-view-graphite.png?v=1',
    salePrice: '125',
    type: 0,
  ),
  ProductWishlist(
    title: 'Iphone 15 Pro 2021 - 256GB',
    image:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-7inch-blacktitanium?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1692845694698',
    status: '30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 1,
  ),
  ProductWishlist(
    title: 'Iphone 15 2021 - 128GB',
    image:
        'https://www.worldshop.eu/medias/img/8941439844382_w1260_717535487/apple-iphone15-smartphone-256gb-black.webp',
    status: 'NEW - 30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'Iphone 15 2021 - 128GB',
    image:
        'https://rewardmobile.co.uk/wp-content/uploads/2023/03/iPhone14-Plus_Yellow_front-back.png',
    status: 'NEW - 30% OFF',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'Iphone 14 Pro 2021 - 128GB',
    image:
        'https://www.iplace.com.br/ccstore/v1/images/?source=/file/v7885850081771667442/products/222256.00-apple-iphone-14-pro-128gb-dourado-mq083be-a.jpg&height=475&width=475',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
  ProductWishlist(
    title: 'Iphone 14 2021 - 128GB',
    image:
        'https://media.cdn.kaufland.de/product-images/2048x2048/26a4fd0d3bdaccf817cffc8ca3f117e5.webp',
    status: 'OUT OF STOCK',
    originalPrice: '1500',
    salePrice: '1200',
    type: 2,
  ),
  ProductWishlist(
    title: 'Iphone 13 Pro 2021 - 128GB',
    image: 'https://media.wisemarket.com.pk/variant/inventory_29173.webp',
    status: 'NEW ARRIVAL',
    originalPrice: '1500',
    salePrice: '1200',
    type: 3,
  ),
];
