import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Searchbar
                  TSearchContainer(
                    text: "Search in store",
                    icon: Iconsax.search_normal,
                  ),
                  const SizedBox(height: TSizes.defaultSpace),

                  /// Categories
                  Padding(
                    padding: const EdgeInsets.only(
                      left: TSizes.defaultSpace,
                      bottom: TSizes.spaceBtwLargeSections,
                    ),
                    child: Column(
                      children: [
                        /// Section Heading
                        TSectionHeading(
                          title: TTexts.popularCategories,
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(height: TSizes.defaultSpace),

                        /// Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.sm,
                horizontal: TSizes.defaultSpace,
              ),
              child: Column(children: [
                TPromoSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Popular Products
                TSectionHeading(
                    title: TTexts.popularProducts, onPressed: () {}),
                const SizedBox(height: TSizes.defaultSpace),

                TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => TProductCardVertical(
                    product: products[index],
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
