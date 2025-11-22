import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandCards extends StatelessWidget {
  const TBrandCards({
    super.key,
    required this.title,
    required this.image,
    required this.itemCount,
    required this.showBorder,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.onTap,
  });

  final String title;
  final String image;
  final int itemCount;
  final bool showBorder;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: TRoundedContainer(
        padding: padding,
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        borderColor: dark ? TColors.darkGrey : TColors.grey,
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: TCircularImage(
                image: image,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleTextWithVerifiedIcon(
                    title: title,
                    brandTextSize: TextSizes.large,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 4,
                  ),
                  Text(
                    '$itemCount products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
