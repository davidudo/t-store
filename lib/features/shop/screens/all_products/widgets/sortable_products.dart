import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatefulWidget {
  const TSortableProducts({super.key, required this.products});

  final List<Map<String, dynamic>> products;

  @override
  State<TSortableProducts> createState() => _TSortableProductsState();
}

class _TSortableProductsState extends State<TSortableProducts> {
  String _selectedOption = 'Name';

  final List<Map<String, String>> _sortOptions = [
    {'value': 'name', 'label': 'Name'},
    {'value': 'price_low_high', 'label': 'Price: Low to High'},
    {'value': 'price_high_low', 'label': 'Price: High to Low'},
    {'value': 'sales', 'label': 'Sales'},
    {'value': 'newest', 'label': 'Newest Arrivals'},
    {'value': 'popularity', 'label': 'Popularity'},
  ];

  double _getProductPrice(Map<String, dynamic> product) {
    if (product['hasDiscount'] == true) {
      return (product['price'] as num).toDouble();
    }

    if (product['priceRange'] != null) {
      return ((product['priceRange'] as Map<String, dynamic>)['min'] as num)
          .toDouble();
    }

    if (product['price'] != null) {
      return (product['price'] as num).toDouble();
    }

    return 0.0;
  }

  List<Map<String, dynamic>> get _sortedProducts {
    final sorted = List<Map<String, dynamic>>.from(widget.products);

    if (_selectedOption == 'Name') {
      sorted.sort(
          (a, b) => (a['title'] as String).compareTo(b['title'] as String));
    }

    if (_selectedOption == 'Price: Low to High') {
      sorted.sort((a, b) => _getProductPrice(a).compareTo(_getProductPrice(b)));
    }

    if (_selectedOption == 'Price: High to Low') {
      sorted.sort((a, b) => _getProductPrice(b).compareTo(_getProductPrice(a)));
    }

    if (_selectedOption == 'Sales') {
      sorted.sort((a, b) {
        final aDiscount = a['discountPercent'] ?? 0;
        final bDiscount = b['discountPercent'] ?? 0;
        return (bDiscount as int).compareTo(aDiscount as int);
      });
    }

    return sorted;
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Text(
                'Sort Products By',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),

              // Sort Options
              ..._sortOptions.map((option) {
                final isSelected = _selectedOption == option['label'];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    option['label']!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isSelected ? TColors.primary : null,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: TColors.primary)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedOption = option['label']!;
                    });
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sortedList = _sortedProducts;

    return Column(
      children: [
        /// Custom Filter Dropdown Trigger
        GestureDetector(
          onTap: () => _showFilterBottomSheet(context),
          child: InputDecorator(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            child: Text(
              _selectedOption,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: TSizes.defaultSpace),

        /// Products
        TGridLayout(
          itemCount: sortedList.length,
          itemBuilder: (_, index) => TProductCardVertical(
            product: sortedList[index],
          ),
        ),
      ],
    );
  }
}
