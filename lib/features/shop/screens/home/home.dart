import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),

                  /// Searchbar
                  TSearchContainer(
                    text: "Search in store",
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.defaultSpace),

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
                          title: 'Popular Categories',
                          showActionButton: false,
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
                vertical: TSizes.defaultSpace,
                horizontal: TSizes.sm,
              ),
              child: TPromoSlider(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
