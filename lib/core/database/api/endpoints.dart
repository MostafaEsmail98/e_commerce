class Endpoints {
  static String endpoint = "https://ecommerce.routemisr.com/api/v1/";
  static String signIn = "auth/signin";
  static String signUp = "auth/signup";
  static String forgetPassword = "auth/forgotPasswords";
  static String verifyCode = "auth/verifyResetCode";
  static String resetPassword = "auth/resetPassword";
  static String categories = "categories";
  static String brands = "brands";
  static String product = "products?brand=";
  static String productOfCategory = "products?category[in]=";
  static String specificProduct = "products/";
  static String categoriesTab = "products?category[in]=";
  static String wishlist = "wishlist";
  static String cart = "cart";
  static String updateUser = "users/updateMe/";
  static String getUser = "users/";
  static String changePassword = "users/changeMyPassword";
  static String checkout = "orders/checkout-session/";
}

class ApiKey {
static String name =  "name";
static String user =  "user";
static String email =  "email";
static String token =  "token";
static String message =  "message";
static String role =  "role";
static String statusMsg =  "statusMsg";
static String status =  "status";
static String id =  "_id";
static String slug =  "slug";
static String createdAt =  "createdAt";
static String updatedAt =  "updatedAt";
static String data =  'data';
static String image =  "image";
static String metadata =  "metadata";
static String currentPage =  "currentPage";
static String numberOfPages =  "numberOfPages";
static String limit =  "limit";
static String results =  "results";
static String productId =  "productId";
}