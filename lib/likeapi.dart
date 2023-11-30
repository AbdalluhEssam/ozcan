class AppLink {
//================================== Hosting ===============================//
  static const String serverLink = "https://abdalluh-essam.com/ozcan";
//================================== Image ===============================//
  static const String imageStatic = "$serverLink/upload";
  static const String imageServices = "$imageStatic/services";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String imageBanner = "$imageStatic/banner";
  static const String imageHome = "$imageStatic/home";
  static const String imageInfo = "$imageStatic/info";
  static const String imageStory = "$imageStatic/story";
//================================== Auth ===============================//
  static const String signUp = "$serverLink/auth/signup.php";
  static const String verfiyCodeSignUp = "$serverLink/auth/verfiycode.php";
  static const String reSend = "$serverLink/auth/resend.php";
  static const String login = "$serverLink/auth/login.php";
//================================== Forget Password ===============================//
  static const String checkEmail = "$serverLink/forgetpassword/checkemail.php";
  static const String verfiyCodeForgetPass ="$serverLink/forgetpassword/verfiycode.php";
  static const String resetPassword ="$serverLink/forgetpassword/resetpassword.php";
//================================== Home ===============================//
  static const String homePage = "$serverLink/home.php";
  static const String infoPage = "$serverLink/info.php";
  static const String searchPage = "$serverLink/search.php";
  static const String senp = "$serverLink/s.php";
  static const String search  = "$serverLink/items/search.php";
  static const String items = "$serverLink/categories/view.php";
  static const String departmentView = "$serverLink/categories/viewbanner.php";
  static const String glusSerPage = "$serverLink/categories/glusservies.php";
//================================== Favorite ===============================//
  static const String addFavorite       = "$serverLink/favorite/add.php";
  static const String deleteFavorite    = "$serverLink/favorite/delete.php";
  static const String deleteEndFavorite = "$serverLink/favorite/deleteend.php";
  static const String viewFavorite      = "$serverLink/favorite/view.php";
//================================== CART ===============================//
  static const String cardView      = "$serverLink/cart/viewcard.php";
  static const String cardAdd       = "$serverLink/cart/insertcart.php";
  static const String cardCount     = "$serverLink/cart/count.php";
  static const String cardDelete    = "$serverLink/cart/deletecart.php";
//================================== Check Coupon ===============================//
  static const String couponView   = "$serverLink/coupon/checkcoupon.php";
//================================== ORDERS ===============================//
  static const String checkOutAdd = "$serverLink/orders/checkout.php";
  static const String pendingOrders = "$serverLink/orders/pending.php";
  static const String archiveOrders = "$serverLink/orders/archive.php";
  static const String addRatingOrders = "$serverLink/orders/rating.php";
  static const String detailsOrders = "$serverLink/orders/details.php";
//================================== NOTIFICATION ===============================//
  static const String notification = "$serverLink/notification.php";
//================================== OFFERS ===============================//
  static const String offers = "$serverLink/offers.php";
//================================== story ===============================//
  static const String story = "$serverLink/categories/story.php";
  static const String storyTop = "$serverLink/categories/storytop.php";
  static const String updateLike = "$serverLink/categories/updatalike.php";
//================================== END ===============================//
}
