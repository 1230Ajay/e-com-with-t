class OnboardingEnitity {
  final String image;
  final String title;
  final String subTitle;
  OnboardingEnitity(
      {required this.image, required this.title, required this.subTitle});
  static List<OnboardingEnitity> fromJson(List<Map<String, String>> jsonData) {
    return jsonData.map((onboarding) {
      return OnboardingEnitity(
          image: onboarding["image"] ?? "",
          title: onboarding["title"] ?? "",
          subTitle: onboarding["subTitle"] ?? "");
    }).toList();
  }
}
