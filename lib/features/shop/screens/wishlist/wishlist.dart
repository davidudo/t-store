import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'title': 'Green Nike Air Shoes',
        'brand': 'Nike',
        'image': TImages.productImage1,
        'priceRange': {'min': 120, 'max': 180},
        'hasDiscount': false,
      },
      {
        'title': 'Blue T-shirt for All Ages',
        'brand': 'Zara',
        'image': TImages.productImage55,
        'price': 29.99,
        'hasDiscount': false,
      },
      {
        'title': '4 Color Collar T-shirt Dry Fit',
        'brand': 'Zara',
        'image': TImages.productImage60,
        'price': 24.99,
        'originalPrice': 34.99,
        'discountPercent': 29,
        'hasDiscount': true,
      },
      {
        'title': 'Leather Brown Jacket',
        'brand': 'Zara',
        'image': TImages.productImage64,
        'priceRange': {'min': 199, 'max': 299},
        'hasDiscount': false,
      },
      {
        'title': 'Green Nike Air Shoes',
        'brand': 'Nike',
        'image': TImages.productImage1,
        'priceRange': {'min': 120, 'max': 180},
        'hasDiscount': false,
      },
      {
        'title': 'Blue T-shirt for All Ages',
        'brand': 'Zara',
        'image': TImages.productImage55,
        'price': 29.99,
        'hasDiscount': false,
      },
      {
        'title': '4 Color Collar T-shirt Dry Fit',
        'brand': 'Zara',
        'image': TImages.productImage60,
        'price': 24.99,
        'originalPrice': 34.99,
        'discountPercent': 29,
        'hasDiscount': true,
      },
      {
        'title': 'Leather Brown Jacket',
        'brand': 'Zara',
        'image': TImages.productImage64,
        'priceRange': {'min': 199, 'max': 299},
        'hasDiscount': false,
      },
    ];

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 8,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: products[index],
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
