import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: TDeviceUtils.getAppBarHeight() + 25,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(
            activeDotColor: isDarkMode ? TColors.light : TColors.dark,
            dotHeight: 6,
          ),
        ),
      ),
    );
  }
}
