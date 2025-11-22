import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          indicatorColor: Colors.transparent,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: TColors.primary,
                  fontSize: TSizes.fontSizeSm * 0.8,
                );
              }
              return TextStyle(
                fontSize: TSizes.fontSizeSm * 0.8,
                color: darkMode
                    ? TColors.white.withValues(alpha: 0.5)
                    : TColors.black.withValues(alpha: 0.5),
              );
            },
          ),
          backgroundColor: darkMode
              ? TColors.white.withValues(alpha: 0.1)
              : TColors.black.withValues(alpha: 0.1),
          destinations: _buildNavigationDestinations(controller),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  List<NavigationDestination> _buildNavigationDestinations(
    NavigationController controller,
  ) {
    final destinations = [
      _NavigationItem(Iconsax.home, 'Home', 0),
      _NavigationItem(Iconsax.shop, 'Store', 1),
      _NavigationItem(Iconsax.heart, 'Wishlist', 2),
      _NavigationItem(Iconsax.user, 'Profile', 3),
    ];

    return destinations
        .map((item) => _buildNavigationDestination(controller, item))
        .toList();
  }

  NavigationDestination _buildNavigationDestination(
    NavigationController controller,
    _NavigationItem item,
  ) {
    final isSelected = controller.selectedIndex.value == item.index;
    final iconColor = isSelected ? TColors.primary : null;
    const padding = EdgeInsets.only(bottom: 2);

    return NavigationDestination(
      icon: Padding(
        padding: padding,
        child: Icon(item.icon, color: iconColor),
      ),
      label: item.label,
      selectedIcon: Padding(
        padding: padding,
        child: Icon(item.icon, color: iconColor),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final String label;
  final int index;

  const _NavigationItem(this.icon, this.label, this.index);
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    Container(color: Colors.blue),
  ];
}
