import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_showcase.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
  });

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
    ];

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              TBrandShowcase(
                title: 'Nike',
                brandImage: TImages.nikeLogo,
                itemCount: 253,
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1,
                ],
              ),
              TBrandShowcase(
                title: 'Zara',
                brandImage: TImages.zaraLogo,
                itemCount: 20,
                images: [
                  TImages.productImage4,
                  TImages.productImage5,
                  TImages.productImage6,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              TSectionHeading(title: 'Your might like', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: products[index],
                  onTap: () {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
