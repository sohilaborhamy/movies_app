

import '../../../core/constants/assets_app.dart';

class OnboardingModel {
  String image;
  String header;
  String? description;

  OnboardingModel({
    required this.image,
    required this.header,
    this.description,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
        image: AssetsApp.onboardingOne,
        header: "Discover Movies",
        description:
            "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease."),
    OnboardingModel(
        image: AssetsApp.onboardingTwo,
        header: "Explore All Genres",
        description:
            "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day."),
    OnboardingModel(
        image: AssetsApp.onboardingThree,
        header: "Create Watchlists",
        description:
            "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres."),
    OnboardingModel(
        image: AssetsApp.onboardingFour,
        header: "Rate, Review, and Learn",
        description:
            "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews."),
    OnboardingModel(
      image: AssetsApp.onboardingFive,
      header: "Start Watching Now",
    ),
  ];
}
