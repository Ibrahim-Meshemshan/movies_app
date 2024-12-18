import 'package:flutter/material.dart';
import 'package:movies_app/core/Theme/Theme_manager.dart';
import 'package:movies_app/features/initial_page/home_page.dart';
import 'package:movies_app/features/onboarding/widgets/smoot_custom.dart';

import 'onboarding_data.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: OnboardingData.list.length,
            itemBuilder: (context, index) {
              final item = OnboardingData.list[index];
              final size = OnboardingData.imageSizes[index];
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      item.image,
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xff171725),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            item.title,
                            style:
                                ThemeManager.nightTheme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            textAlign: TextAlign.center,
                            item.subTitle,
                            style: ThemeManager.nightTheme.textTheme.titleSmall
                                ?.copyWith(color: const Color(0xff92929d)),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothCustom(
                                controller: controller,
                                count: OnboardingData.list.length,
                                smoothColors: const Color(0xff12cdd9),
                              ),
                              SizedBox(
                                width: 75,
                                height: 75,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.page!.toInt() <
                                        OnboardingData.list.length - 1) {
                                      controller.animateToPage(
                                        controller.page!.toInt() + 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff12cdd9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 25),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
