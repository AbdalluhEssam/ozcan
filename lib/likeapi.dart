class AppLink {
//================================== Hosting ===============================//
  static const String serverLink = "https://back.cp.ozcanbrand.com/api/v1";
  static const String serverImage = "https://ozcan.almirsystem.com/uploads";
//================================== Image ===============================//
  static const String imageStatic = "$serverImage";
  static const String imageServices = "$serverImage";
  static const String imageCategories = "$serverImage";
  static const String imageItems = "$serverImage";
  static const String imageBanner = "$serverImage";
  static const String imageHome = "$serverImage";
  static const String imageInfo = "$serverImage";
  static const String imageStory = "$serverImage";
//================================== Auth ===============================//
  static const String signUp = "$serverLink/register";
  static const String verfiyCodeSignUp = "$serverLink/auth/verfiycode.php";
  static const String reSend = "$serverLink/auth/resend.php";
  static const String login = "$serverLink/login";
//================================== Forget Password ===============================//
  static const String checkEmail = "$serverLink/forgetpassword/checkemail.php";
  static const String verfiyCodeForgetPass ="$serverLink/forgetpassword/verfiycode.php";
  static const String resetPassword ="$serverLink/forgetpassword/resetpassword.php";
//================================== Home ===============================//
  static const String homePage = "$serverLink/home/images";
  static const String categories = "$serverLink/categories";
  static const String aboutUs = "$serverLink/pages";
  static const String infoPage = "$serverLink/social-accounts";
  static const String searchPage = "$serverLink/search.php";
  static const String senp = "$serverLink/s.php";
  static const String search  = "$serverLink/items/search.php";
  static const String items = "$serverLink/categories/view.php";
  static const String imageProduct = "$serverLink/categories/image.php";
  static const String departmentView = "$serverLink/categories";
  static const String glusSerPage = "$serverLink/categories/glusservies.php";
//================================== Like ===============================//
  static const String addLike           = "$serverLink/categories/likes/add.php";
  static const String deleteLikes    = "$serverLink/categories/likes/delete.php";
//================================== LikeStory ===============================//
  static const String addLikeStory           = "$serverLink/categories/likesstory/add.php";
  static const String deleteLikesStory    = "$serverLink/categories/likesstory/delete.php";
//================================== CART ===============================//
  static const String orderView      = "$serverLink/cart/view.php";
  static const String cardAdd       = "$serverLink/cart/insertcart.php";
  static const String cardCount     = "$serverLink/cart/count.php";
  static const String cardDelete    = "$serverLink/cart/deletecart.php";
//================================== Check Coupon ===============================//
  static const String couponView   = "$serverLink/coupon/checkcoupon.php";
//================================== ORDERS ===============================//
  static const String checkOutAdd = "$serverLink/orders/checkout.php";
  static const String pendingOrders = "$serverLink/orders/pending.php";
  static const String archiveOrders = "$serverLink/cart/viewAll.php";
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
//================================== Chat ===============================//
  static const String viewChat = "$serverLink/chat/view.php";
  static const String addChat = "$serverLink/chat/chat.php";
//================================== ChatBot ===============================//
  static const String viewChatBot = "https://ozcan.almirsystem.com/chatapi/api/chat/chat.php";
  // static const String addChatBot = "https://ozcan.almirsystem.com/chatapi/api/user/insert.php";
  static const String addChatBot = "https://ozcan.almirsystem.com/chatapi/api/tikc/insert.php";
  static const String addMassageBot = "https://ozcan.almirsystem.com/chatapi/api/msg/insert.php";
  static const String editStatus = "$serverLink/cart/updateorder.php";
  static const String orderId = "$serverLink/cart/orderid.php";
  static const String image = "https://ozcan.almirsystem.com/api/upload-image-endpoint";
  // static const String addMassageBot = "https://ozcan.almirsystem.com/chatapi/api/tikc/insert.php";
//================================== END ===============================//
}
