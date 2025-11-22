import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
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
          destinations: [
            NavigationDestination(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.home,
                  color: controller.selectedIndex.value == 0
                      ? TColors.primary
                      : null,
                ),
              ),
              label: 'Home',
              selectedIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.home,
                  color: controller.selectedIndex.value == 0
                      ? TColors.primary
                      : null,
                ),
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.shop,
                  color: controller.selectedIndex.value == 1
                      ? TColors.primary
                      : null,
                ),
              ),
              label: 'Store',
              selectedIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.shop,
                  color: controller.selectedIndex.value == 1
                      ? TColors.primary
                      : null,
                ),
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.heart,
                  color: controller.selectedIndex.value == 2
                      ? TColors.primary
                      : null,
                ),
              ),
              label: 'Wishlist',
              selectedIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.heart,
                  color: controller.selectedIndex.value == 2
                      ? TColors.primary
                      : null,
                ),
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.user,
                  color: controller.selectedIndex.value == 3
                      ? TColors.primary
                      : null,
                ),
              ),
              label: 'Profile',
              selectedIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Iconsax.user,
                  color: controller.selectedIndex.value == 3
                      ? TColors.primary
                      : null,
                ),
              ),
            ),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
    Container(color: Colors.purple),
  ];
}
