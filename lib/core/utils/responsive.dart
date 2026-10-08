import 'package:flutter/material.dart';

extension ResponsiveX on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1000;

  T responsive<T>({
    required T mobile,
    required T tablet,
    required T desktop,
  }) =>
      isMobile ? mobile : (isTablet ? tablet : desktop);
}

/// Centers content and caps its width on large screens.
class ContentWidth extends StatelessWidget {
  final Widget child;

  const ContentWidth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}