abstract class AppEndpoints {
  // static const String baseUrl = "10.0.2.2:8000"; // For Emulator
  static const String baseUrl = "192.168.155.136:8000"; // For A34
  static const String apiVersion = "/api/v1";

  static const String getCategoriesAsPair = "/category/get_categories_as_pair";

  //-------------------------------------------

  // Authentication Routes
  static const String register = "$apiVersion/auth/register";
  static const String login = "$apiVersion/auth/login";
  static const String logout = "$apiVersion/auth/logout";

  //-------------------------------------------

  static const String getHome = "$apiVersion/get_home";
  static const String getExperts = "$apiVersion/get_experts";
////-------------------------------------------
}
