import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SmoothCustom extends StatelessWidget {
  const SmoothCustom({super.key, required this.controller, required this.count, required this.smoothColors});
 final PageController controller;
 final int count;
 final Color smoothColors;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect:  ExpandingDotsEffect(
        dotHeight: 10,
        dotWidth: 10,
        expansionFactor: 3,
        activeDotColor: smoothColors,
        dotColor: Colors.grey,
      ),
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
