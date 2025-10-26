import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppTextStyles.font20BlackBold,
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ---- Profile Header ----
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: const CachedNetworkImageProvider(
                        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
                      ),
                      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'john.doe@email.com',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AppButton(
                      buttonText: 'Edit profile',
                      textStyle: AppTextStyles.font14BlackRegular,
                      height: 35.h,
                      backgroundColor: AppColors.secondaryColor,
                      width: 1.sw / 3,
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---- Profile Info Section ----
              _buildInfoCard(
                icon: Icons.phone,
                label: 'Phone Number',
                value: '+20 100 123 4567',
              ),
              _buildInfoCard(
                icon: Icons.location_on_outlined,
                label: 'Address',
                value: 'Cairo, Egypt',
              ),
              _buildInfoCard(
                icon: Icons.calendar_today_outlined,
                label: 'Date of Birth',
                value: 'Jan 1, 1995',
              ),
              _buildInfoCard(
                icon: Icons.person_outline,
                label: 'Gender',
                value: 'Male',
              ),

              const SizedBox(height: 24),

              // ---- Logout Button ----
              AppButton(
                buttonText: 'Log out',
                backgroundColor: Colors.redAccent,
                height: 40.h,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Info Card Builder ----
  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
