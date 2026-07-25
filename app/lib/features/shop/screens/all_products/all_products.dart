import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/features/shop/screens/all_products/widgets/sortable_products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

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
      appBar: const TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(products: products),
        ),
      ),
    );
  }
}
