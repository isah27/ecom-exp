import 'package:ecom_exp/features/product/domain/repo.dart';
import 'package:ecom_exp/features/product/data/repo/product_assets.dart';
import 'package:ecom_exp/features/product/data/models/product_model.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  List<ProductModel> fetchProducts() {
    return [
      ProductModel(
        id: '1',
        name: 'Apple iPhone 16\n128GB|Teal',
        quantity: 5,
        description:
            "Experience the next level of performance with the Apple iPhone 16, featuring a stunning Teal finish and 128GB of storage. With a sleek design, powerful A-series chip, and advanced camera system, it's built for speed, style, and seamless connectivity.",
        price: "\$700.00",
        imageUrl: ProductAssets.iphone,
      ),
      ProductModel(
        id: '2',
        name: 'M4 Macbook Air 13”\n256GB|Sky blue',
        quantity: 5,
        description:
            "Lightweight, powerful, and beautifully designed, the M4 MacBook Air 13″ in Sky Blue delivers exceptional performance with the latest Apple silicon. Featuring 256GB of fast SSD storage, a vibrant Retina display, and all-day battery life, it’s the perfect laptop for work, creativity, and everything in between.",
        price: "\$1000.00",
        imageUrl: ProductAssets.macbook,
      ),
      ProductModel(
        id: '3',
        name: 'Google Pixel 9A\n128GB|Iris',
        quantity: 5,
        description:
            "Smart, fast, and beautifully simple — the Google Pixel 9A in Iris offers 128GB of storage and the latest Google AI features. Capture stunning photos, enjoy smooth performance, and stay secure with Google’s signature clean Android experience in a sleek and stylish design.",
        price: "\$499.00",
        imageUrl: ProductAssets.googlePixel,
      ),
      ProductModel(
        id: '4',
        name: 'Apple Airpods 4\nActive Noise Cancellation|Teal',
        quantity: 5,
        description:
            "Immerse yourself in rich, clear sound with the Apple AirPods 4 in a unique Teal finish. Featuring advanced Active Noise Cancellation, improved battery life, and seamless connectivity with all your Apple devices, they’re designed for a truly wireless, distraction-free audio experience.",
        price: "\$255.00",
        imageUrl: ProductAssets.airpod,
      ),
    ];
  }
}
