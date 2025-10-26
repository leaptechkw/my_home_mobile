import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/features/home/presentation/pages/home_screen.dart';
import 'package:my_home/features/search/presentation/pages/search_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const Center(child: Text('Cart')),
    const Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
          elevation: 0,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 22.w,
                height: 22.h,
                'assets/svgs/home.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0
                      ? AppColors.primaryColor
                      : Colors.grey.shade500,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 22.w,
                height: 22.h,
                'assets/svgs/search.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1
                      ? AppColors.primaryColor
                      : Colors.grey.shade500,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 22.w,
                height: 22.h,
                'assets/svgs/cart.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2
                      ? AppColors.primaryColor
                      : Colors.grey.shade500,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 22.w,
                height: 22.h,
                'assets/svgs/profile.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3
                      ? AppColors.primaryColor
                      : Colors.grey.shade500,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
