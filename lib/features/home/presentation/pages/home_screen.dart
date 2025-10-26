import 'package:flutter/material.dart';
import 'package:my_home/features/home/presentation/widgets/custom_drawer.dart';
import 'package:my_home/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: const HomeScreenBody(),
      ),
    );
  }
}
