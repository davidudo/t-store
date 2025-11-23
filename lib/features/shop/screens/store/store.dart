import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/app_bar/tab_bar.dart';
import 'package:t_store/common/widgets/brands/brand_cards.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      /// Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in store',
                        icon: Iconsax.search_normal,
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsetsGeometry.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Featured Brands
                      TSectionHeading(
                          title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TGridLayout(
                        mainAxisExtent: 70,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return TBrandCards(
                            title: 'Nike',
                            image: TImages.clothIcon,
                            itemCount: 256,
                            showBorder: true,
                          );
                        },
                      )
                    ],
                  ),
                ),

                /// Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetrics')),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(children: [
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
          ]),
        ),
      ),
    );
  }
}
