import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // ---- Drawer Header ----
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              backgroundImage: const CachedNetworkImageProvider(
                'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
              ),
            ),
            accountName: const Text(
              'John Doe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: const Text(
              'john.doe@email.com',
              style: TextStyle(fontSize: 14),
            ),
          ),

          // ---- Menu Items ----
          Column(
            children: [
              _buildDrawerItem(
                iconPath: 'assets/svgs/home.svg',
                text: 'Home',
                onTap: () => Navigator.pop(context),
              ),
              _buildDrawerItem(
                iconPath: 'assets/svgs/profile.svg',
                text: 'Profile',
                onTap: () {},
              ),
              _buildDrawerItem(
                iconPath: 'assets/svgs/ring.svg',
                text: 'Notifications',
                onTap: () {},
              ),
              _buildDrawerItem(
                iconPath: 'assets/svgs/language.svg',
                text: 'language',
                onTap: () {},
              ),
              _buildDrawerItem(
                iconPath: 'assets/svgs/apperance.svg',
                text: 'Apperance',
                onTap: () {},
              ),
              const Divider(height: 24, thickness: 1),
              _buildDrawerItem(
                iconPath: 'assets/svgs/telephone.svg',
                text: 'Help & Support',
                onTap: () {},
              ),
              _buildDrawerItem(
                iconPath: 'assets/svgs/about.svg',
                text: 'About App',
                onTap: () {},
              ),
              _buildDrawerItem(
                iconPath: 'assets/svgs/delete.svg',
                text: 'Delete my account',
                lineColor: Colors.redAccent,
                onTap: () {},
              ),
            ],
          ),
          Spacer(),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
            child: AppButton(
              buttonText: 'Log out',
              onPressed: () {},
              height: 35.h,
              backgroundColor: Colors.redAccent,
            ),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }

  // ---- Drawer Item Builder ----
  Widget _buildDrawerItem({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
    Color? lineColor,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        color: lineColor ?? AppColors.primaryColor,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            color: lineColor ?? Colors.black,
            fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
