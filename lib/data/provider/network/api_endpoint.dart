class APIEndpoint {
  static String get _baseUrl =>
      "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test";

  static String get recipes => "$_baseUrl/recipes.json";
}
