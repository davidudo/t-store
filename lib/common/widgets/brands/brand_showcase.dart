import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_cards.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.title,
    required this.itemCount,
    required this.brandImage,
    required this.images,
  });

  final String title;
  final int itemCount;
  final String brandImage;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      borderColor: dark ? TColors.darkGrey : TColors.grey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          TBrandCards(
            title: title,
            image: brandImage,
            itemCount: itemCount,
            showBorder: false,
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: TSizes.spaceBtwItems * 0.8),

          /// Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImage(image, dark))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImage(String image, dark) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroundColor: dark ? TColors.darkerGrey : TColors.light,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(
        right: TSizes.sm,
      ),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
