import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/overall_product_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Overall Product Rating
                TOverallProductRating(),
                TRatingIndicator(rating: 4.5, itemSize: 20),
                Text(
                  '12,611',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// User Review Lists
                TUserReviewCard(),
                TUserReviewCard(),
                TUserReviewCard(),
                TUserReviewCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
