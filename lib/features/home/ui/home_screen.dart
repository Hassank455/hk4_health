import 'package:flutter/material.dart';
import 'package:hk4_health/features/home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: const Column(
            children: [
              HomeTopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
