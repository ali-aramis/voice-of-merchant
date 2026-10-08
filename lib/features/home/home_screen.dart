import 'package:flutter/material.dart';
import 'home_actions.dart';
import 'home_features.dart';
import 'home_footer.dart';
import 'home_header.dart';
import 'home_hero.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeHeader()),
            SliverToBoxAdapter(child: HomeHero()),
            SliverToBoxAdapter(child: HomeActions()),
            SliverToBoxAdapter(child: HomeFeatures()),
            // Pins the footer to the bottom on tall screens.
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(child: SizedBox(height: 56)),
                  HomeFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}