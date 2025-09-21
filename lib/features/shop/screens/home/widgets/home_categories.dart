import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Sports',
        'image': TImages.sportIcon,
      },
      {
        'title': 'Clothing',
        'image': TImages.clothIcon,
      },
      {
        'title': 'Shoes',
        'image': TImages.shoeIcon,
      },
      {
        'title': 'Cosmetics',
        'image': TImages.cosmeticsIcon,
      },
      {
        'title': 'Pets',
        'image': TImages.animalIcon,
      },
      {
        'title': 'Toys',
        'image': TImages.toyIcon,
      },
      {
        'title': 'Furniture',
        'image': TImages.furnitureIcon,
      },
      {
        'title': 'Jewelery',
        'image': TImages.jeweleryIcon,
      },
      {
        'title': 'Electronics',
        'image': TImages.electronicsIcon,
      },
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return TVerticalImageText(
            title: category['title'],
            image: category['image'],
            onTap: () {},
          );
        },
      ),
    );
  }
}
