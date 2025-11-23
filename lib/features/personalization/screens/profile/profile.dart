import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  TCircularImage(
                    image: TImages.user,
                    width: 80,
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Change Profile Picture'),
                  )
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Details
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Profile Information
            TSectionHeading(
              title: 'Profile Information',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(title: 'Name', value: 'David Udo', onTap: () {}),
            TProfileMenu(title: 'Username', value: 'davidudo', onTap: () {}),

            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Personal Information
            TSectionHeading(
              title: 'Personal Information',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(
              title: 'User ID',
              value: '45689',
              icon: Iconsax.copy,
              onTap: () {},
            ),
            TProfileMenu(
              title: 'E-mail',
              value: 'udodavid46.ud@gmail.com',
              onTap: () {},
            ),
            TProfileMenu(
              title: 'Phone Number',
              value: '+234 8057104772',
              onTap: () {},
            ),
            TProfileMenu(title: 'Gender', value: 'Male', onTap: () {}),
            TProfileMenu(
              title: 'Date of Birth',
              value: '10 Oct 1994',
              onTap: () {},
            ),

            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Close Account Button
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Close Account',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
