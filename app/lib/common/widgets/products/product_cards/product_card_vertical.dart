import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/plain_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/screens/product_detail/product_detail.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
    required this.product,
    this.onTap,
  });

  final Map<String, dynamic> product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 280),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          boxShadow: [
            if (!dark) TShadowStyle.verticalProductShadow,
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail, Wishlist & Discount Tag
            TRoundedContainer(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  TRoundedImage(
                    imageUrl: product['image'] ?? TImages.productImage1,
                    applyImageRadius: true,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    width: double.infinity,
                  ),

                  /// Discount Tag
                  if (product['hasDiscount'] == true)
                    Positioned(
                      top: 0,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor:
                            TColors.secondary.withValues(alpha: 0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm,
                          vertical: TSizes.xs,
                        ),
                        child: Text(
                          '${product['discountPercent']}%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),

                  /// Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TPlainIcon(
                      icon: Iconsax.heart5,
                      color: TColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: product['title'] ?? '',
                          smallSize: true,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems / 4),
                        TBrandTitleTextWithVerifiedIcon(
                          title: product['brand'],
                        ),
                      ],
                    ),

                    /// Price and Add Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// Price Display
                        _buildPriceDisplay(context),

                        /// Add to Cart Button
                        Container(
                          decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: SizedBox(
                            width: TSizes.iconLg * 1.1,
                            height: TSizes.iconLg * 1.1,
                            child: const Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDisplay(BuildContext context) {
    final hasDiscount = product['hasDiscount'] == true;
    final hasPriceRange = product['priceRange'] != null;

    if (hasDiscount) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Original Price
          Text(
            '${product['originalPrice']}',
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          const SizedBox(height: 2),

          /// Discounted Price
          TProductPriceText(price: '${product['price']}'),
        ],
      );
    } else if (hasPriceRange) {
      final priceRange = product['priceRange'] as Map<String, dynamic>;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Row(
            children: [
              TProductPriceText(price: '${priceRange['min']}'),
              Text(' - ', style: Theme.of(context).textTheme.bodySmall),
              TProductPriceText(price: '${priceRange['max']}'),
            ],
          ),
        ],
      );
    } else {
      return TProductPriceText(price: '${product['price']}');
    }
  }
}
