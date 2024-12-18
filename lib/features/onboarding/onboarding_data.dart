import 'dart:ui';

class OnboardingData {
  final String title;
  final String subTitle;
  final String image;

  OnboardingData({
    required this.title,
    required this.subTitle,
    required this.image,
  });


  static final List<OnboardingData> list = [
    OnboardingData(
      title: 'The biggest international and local film streaming',
      subTitle: 'MOVIZONE brings you the best of both international and local cinema.'
          ' Start your cinematic journey with us today!',
      image: 'assets/images/onboarding_v1.png',
    ),
    OnboardingData(
      title: 'Offers ad-free viewing of high quality',
      subTitle: 'Experience your favorite movies without interruptions. With MOVIZONE',
      image: 'assets/images/onboarding_v2.png',
    ),
    OnboardingData(
      title: 'Our service brings together your favorite series',
      subTitle: 'Our service brings together your favorite series and films in one easy-to-use platform. '
          'Stream anytime, anywhere, and never miss an episode of the shows you love.',
      image: 'assets/images/onboarding_v3.png',
    ),
  ];


  static const List<Size> imageSizes = [
    Size(double.infinity, double.infinity),
    Size(double.infinity, 390),
    Size(double.infinity, 390),
  ];
}
