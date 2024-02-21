class OnBoardingModel {
  OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}

final List<OnBoardingModel> onBoardingModel = [
  OnBoardingModel(
    title: "Find the item you've been looking for",
    description:
        "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience.",
    image: 'assets/images/onboarding1.png',
  ),
  OnBoardingModel(
    title: "Get those shopping bags filled",
    description:
        "Add any item you want to your cart or save it on your wishlist, so you don't miss it in your future purchase.",
    image: 'assets/images/onboarding2.png',
  ),
  OnBoardingModel(
    title: "Fast & Secure payment",
    description:
        "There are many payment options available to speed up and simplify your payment process.",
    image: 'assets/images/onboarding3.png',
  ),
];
