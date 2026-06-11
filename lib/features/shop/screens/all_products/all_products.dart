import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

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
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: [
                  DropdownMenuItem(value: 'name', child: Text('Name')),
                  DropdownMenuItem(
                    value: 'price_low_high',
                    child: Text('Price: Low to High'),
                  ),
                  DropdownMenuItem(
                    value: 'price_high_low',
                    child: Text('Price: High to Low'),
                  ),
                  DropdownMenuItem(value: 'sales', child: Text('Sales')),
                  DropdownMenuItem(
                    value: 'newest',
                    child: Text('Newest Arrivals'),
                  ),
                  DropdownMenuItem(
                    value: 'popularity',
                    child: Text('Popularity'),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),

              /// Products
              TGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) =>
                    TProductCardVertical(product: products[index]),
              ),
              const SizedBox(height: TSizes.defaultSpace),
            ],
          ),
        ),
      ),
    );
  }
}
