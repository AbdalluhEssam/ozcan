import 'package:get/get.dart';

import '../services/services.dart';

class MyTranslation extends Translations {
  MyServices myServices = Get.find();

  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "choose": "اختار اللغه",
          "Ar": "لغة عربية",
          "callus": "تحدث معانا",
          "notice": "إشعار",
          "del": "تم حذف المنتج من المفضلة",
          "add": "تم أضافة المنتج الى المفضلة",
          "not": "تعطيل الاشعارات",
          "cartview": "عربة التسوق",
          "addCart": "أضافة الى عربة التسوق",
          "delCart": "الحذف من عربة التسوق",
          "goToCart": "الذهاب الى عربة التسوق",
          "discount": "الخصم",
          "apply": "تطبيق الخصم",
          "couponfill": "كود الخصم خطا",
          "entercoupon": "ادخل كود الخصم",
          "couponName": "كود الخصم هو : ",
          "deliverytayp": "اختر نوع التوصيل",
          "drivethru": "الطلب من السيارة",
          "shippingaddress": "مكان التوصيل",
          "error": "خطأ",
          "notSelectPayment": "لم تختار طريقة الدفع بعد",
          "notSelectDelivery": "لم تختار نوع التوصيل",

          "En": "اللغة الانجليزية",
          "signin": "تسجيل الدخول",
          "welcome": "مرحبا بيك",
          "par":
              "سجل دخولك عبر البريد الالكترونى و كلمة المرور او عبر وسائل التواصل الاجتماعى",
          "email": "الايميل",
          "hintemail": "ادخل البريد الالكترونى",
          "password": "كلمة السر",
          "hintpass": "ادخل كلمة السر",
          "forget": "نسيت كلمة السر",
          "have": "ليس لديك حساب ؟  ",
          "signup": " انشاء حساب  ",
          "youhave": "هل لديك حساب بالفعل ؟  ",
          "username": "اسم المستخدم",
          "hintusername": "ادخل اسم المستخدم",
          "phone": "الهاتف",
          "hintphone": "ادخل رقم الهاتف",
          "continue": "متابعة",
          "0t": "جودة وأسعار لا مثيل لها",
          "0b": "عائلة Glu - أفضل خدمة عالية الجودة وبأفضل الأسعار",
          "1t": "المهنيين المؤهلين والمعتمدين",
          "1b": "عائلة Glu مدربة تدريباً كاملاً وجاهزة دائمًا لجعل حياتك أسهل",
          "2t": "التدبير المنزلي الكامل",
          "2b": "عائلة Glu أفضل منزل تبقي في مصر",
          "3t": "منتجات glu",
          "3b":
              "يوجد أفضل المنظفات و الملمعات والمزيلات و غسول اليد والمعطرات في glu",
          "check": "التحقق من البريد الالكترونى",
          "verification": "رمز التحقق",
          "checkcode": "تحقق من الكود",
          "parcheckcode":
              "الرجاء إدخال عنوان بريدك الإلكتروني للحصول على رمز التحقق",
          "parcheckcode2": "الرجاء إدخال رمز الرقم المرسل إلى  ",
          "reset": "إعادة تعيين كلمة المرور",
          "newpass": "لمة مرور جديدة",
          "newpass2": "من فضلك ادخل كلمة مرور جديدة",
          "save": "حفظ",
          "repassword": "تاكيد كلمة المرور",
          "rehintpass": "ادخل كلمة المرور مره اخرى للتاكيد",
          "successsignup": "نجح انشاء الحساب",
          "successresetpass": "نحج تعين كلمة مرور جديدة ",
          "congratulations": "مبروك لقد تم التاكيد",
          "gotologin": "اذهب الى صفحة تسجيل الدخول",
          "titleexit": "تنبية",
          "bodyexit": "هل تريد الخروج من التطبيق ؟",
          "yes": "موافق",
          "no": "الغاء",
          "findproduct": "ابحث عن منتج",
          "setting": "الاعدادت",
          "language": "اللغه",
          "about": "من نحن",
          "country": "الدولة",
          "res" :"عدد قطع الريسبشن" ,
          "balconies" :"عددالبلكونات" ,
          "help": "مساعده",
          "welcomeglus": "مرحبا بكم فى Glu's",
          "signupmass": "شكرًا على انضمامك إلى عائلة Glu's نتمنى لك يومًا سعيدًا",
          "logout": "تسجيل الخروج",
          "abouttextglus":
              """ تأسست مجموعة الخليج السعودية قبل 25 ً عاما في مدينة الرياض بالمملكة العربية السعودية كمجموعةاستثمارية مصرية سعودية تتكون من عدد من الشركات المتخصصة في التصنيع والتجارة و المقاوالت العامة والترميم والتشغيل و الصيانة ، مكونة خبرات كبيرة في السوق المصري واالسواق العربية االخرى.
          \n وفي اطار خطة توسع الشركة في مجاالت الخدمات والتصنيع والتجارة تطرح المجموعة منتجها الجديد )جلو glu )والذي ينتمي لشركة Glus وهي شركتنا الرائدة التي هدفها توفير كل خدمات ومنتجات العناية باحتياجات االسرة المصرية. و يسعى glu لتحقيق متطلباتهم بجودة وكفاءة واسعار تنافسية من خالل مجموعة كبيرة من منتجات النظافة والعناية الشخصية.
          \nان هدفنا ليس فقط تقديم خدماتنا ومنتجاتنا بصورة منعزلة عن عمالئنا ولكننا نسعى بطريقه مسؤله و مراعيه للبيئه المادية واالجتماعية لتوفير كل مايلزم من خدماتنا ومنتجاتنا لراحة وسعادة عمالئنا وشركائنا في النجاح.
          \nاننا عندما اطلقنا المجموعة وضعنا استراتيجية موسعة هدفها تلبية متطلبات االسرة المصرية من خالل تحقيق احتياجاتهم من الخدمات والمنتجات برؤية متكاملة تجعل احتياجاتهم اسهل في التلبية وتوفر راحتهم بصورة ذكية وعملية.
          \nونأمل ان يكمل glu استراتيجيتنا وان يكون سفير لمجموعتنا ومعبرا عن اهدافنا وطموحنا وموصل لرسالتنا في كل بيت مصري نتشرف بالتواجد فيه بخدماتنا او منتجاتنا. """,
          "ph011": " ٠١١٤٨٤٠٠١٧٧",
          "categories": "الفئة",
          "cart": "لا يوجد منتجات في قائمة مشترياتك !",
          "products": "المنتجات",
          "total": "اجمالى المبلغ ",
          "incart": "هذا المنتج موجود ليك فى عربتك",
          "delete": "تم حذف المنتج بنجاح",
          "checkout": "ادفع من هنا",
          "checkoutpage": "الدفع",
          "department": "الفئات",
          "addcart": "أضف لسلة التسوق",
          "orders": "طلباتك",
          "success": "تمت الطلبية",
          "priceglus": "السعر يحدد حسب عدد الغرف",
          "price": "السعر",
          "housekeeping": "التدبير المنزلي",
          "count": "لا يمكن أن يكون أقل من واحد",
          "abouttextsg":
              """ تأسست مجموعة الخليج السعودية قبل 25 ً عاما في مدينة الرياض بالمملكة العربية السعودية كمجموعةاستثمارية مصرية سعودية تتكون من عدد من الشركات المتخصصة في التصنيع والتجارة و المقاوالت العامة والترميم والتشغيل و الصيانة ، مكونة خبرات كبيرة في السوق المصري واالسواق العربية االخرى.تأسست مجموعة الخليج السعودية قبل 25 عامًا في مدينة الرياض بالمملكة العربية السعودية كشركة مصرية سعودية متخصصة في مجال المقاولات والترميم والتشطيب وأعمال الصيانة ، وصلت إلي الفئة الثانية بحجم أعمال 8 مليارات ، كما نقدم لعملائنا تصميمات معمارية وتصميمات إنشائية وتصميمات داخلية وديكورات .
          \n لدينا موظفين متخصصين في هذا المجال مثل المهندسين المدنيين ومهندسي الإدارة والصيانة .
          \nعلي مدار تاريخنا ، قدمنا هذه الخدمات في مجالات تخطيط المشاريع والبناء والتجديد ، وقمنا بتنفيذ العديد من المشاريع من قصور وفيلات خاصة ومراكز تجارية ومطاعم وكافيتريات ومستشفيات ومكاتب إدارية ومدارس ومرافق عامة . """,
          "click": "اضغط هنا",
          "address": "عناوينك",
          "addaddress": "اضف غنوان جديد",
          "note": "اضف التفاصيل و الملاحظات ",
          "notede": "الملاحظات : ",
          "addresshint": "الشارع - العمارة - رقم الطابق - الشقة",
          "delivery": "التوصيل",
          "quantity": "عدد المنتجات",
          "deliverytime": "التوصيل خلال 4 ايام عمل",
          "confirmorder": "اكد طلبك",
          "shipping": "عند الاستلام",
          "electronicpayment": "الدفع الالكترونى",
          "soon": "قريبا",
          "choosepaymentmethod": "اختر طريقة الدفع",
          "requesttime": "وقت الطلب : ",
          "idorder": "رقم الفاتورة",
          "1":"قيد الانتظار....",
          "2":"تم التاكيد",
          "3":"تم التوصيل",
          "4":"تم التجهيز",
          "5":"تم الانتهاء",
          "0":"تم الالغاء",
          "calc": "احسب تنظيف شقتك",
          "calcbut": "احسب",
          "room": "عدد الغرف",
          "addservice": "طلب خدمه",
          "priceRoom": "سعر الغرفة",
          "successglus": "تم طلب خدمتك",
          "type": "نوع الباقة",
          "kitchen": "عدد المطبخ",
          "bathroom": "عدد الحمامات",
          "notavailable": "المنتج غير متاح",
          "policyReturn": "سياسة الاسترجاع",

          "returnpolicy": """يمكنك إرجاع المنتج إذا كان ليس ضمن قائمة جلوز للخدمات و القابلة للإرجاع، وإذا استلمته بالحالات التالية :
          
1 - 	منتج غير صحيح (إذا لم يتم استخدام المنتج وفي تغليفه الأصلي السليم وبه كل الملصقات والعلامات).

2 - 	إذا غيرت رأيك أو طلبت منتج عن طريق الخطأ، سنوافق على عملية الإرجاع ضمن الشروط المحددة التالية:

  • وجود المنتجات في تغليفها الأصلي من البائع (علبة مغلقة ومقفولة) وليست تالفة أو في حالة سيئة. يجب أن يكون التغليف مغلق وسليم.
  • سيتم قبول الإرجاع إذا كان المنتج بتغليفه الأصلي السليم.

سيتم إرجاع المبلغ إلى رصيدك على متجرجلوز أو إلى بطاقة الائتمان الخاصة بك، مع قيامنا بفحص المنتجات.
""",



        },
        "en": {
          "choose": "Choose Language",
          "Ar": "Arabic",
          "En": "English",
          "callus": "Talk To Us",
          "notice": "Notice",
          "del": "The product has been removed from your wishlist",
          "add": "The product has been added to your favourites",
          "not": "Disable Notifications",
          "cartview": "My Cart",
          "addCart": "Add To My Cart",
          "delCart": "Remove From Cart",
          "goToCart": "Go To My Cart",
          "addaddress": "Add New Address",
          "discount": "Discount",
          "apply": "Apply Discount",
          "entercoupon": "Enter Coupon Code",
          "couponName": "Coupon Code : ",
          "couponfill": "Coupon error code",
          "checkoutpage": "Check Out",
          "deliverytayp": "Choose Delivery Type",
          "drivethru": "drive Thru",
          "error": "Error",
          "notSelectPayment": "You haven't chosen a payment method yet",
          "notSelectDelivery": "You have not selected the delivery type",
          "signin": "Sign In",
          "welcome": "Welcome Back",
          "par":"Sign In With Email And Password OR Continue With Social Media",
          "email": "Email",
          "hintemail": "Enter Your Email",
          "password": "Password",
          "hintpass": "Enter Your Password",
          "forget": "Forget Password",
          "have": "Don't have an account ?  ",
          "signup": " Sign Up ",
          "youhave": "Do you already have an account ?  ",
          "username": "User Name",
          "hintusername": "Enter Your Name",
          "phone": "Phone",
          "hintphone": "Enter Your Phone Number",
          "continue": "Continue",
          "0t": "Unmatched Quality & Prices",
          "0b":
              "The Glu's Family - the best quality service, at the best price ",
          "1t": "Qualified & verified professionals",
          "1b":
              "The Glu's Family are fully trained and always ready to make your life easier ",
          "2t": "Full House Keeping",
          "2b": "The Glu's Family best HouseKeeping in Egypt ",
          "3t": "Products glu",
          "3b":
              "There are the best cleansers, polishes, removers, hand wash and fresheners in glu",
          "check": "Check Your Email",
          "verification": "Verification Code",
          "checkcode": "Check Code",
          "parcheckcode":
              "Please Enter Your Email Address To Receive A Verification Code",
          "parcheckcode2":
              "Please Enter The Digit Code Sent To ",
          "reset": "Reset Password",
          "newpass": "New Password",
          "newpass2": "Please Enter New Password",
          "save": "Save",
          "repassword": "Re Password",
          "rehintpass": "Re Enter Your Password",
          "successsignup": "Success SignUp",
          "successresetpass": "Success Reset Password",
          "congratulations": "Congratulations",
          "gotologin": "Go To Login",
          "titleexit": "Alert",
          "bodyexit": "Do you want to exit the application?",
          "yes": "Confirm",
          "no": "Cancel",
          "note": "Add Details and Notes",
          "res" :"Number of Reception pieces" ,
          "findproduct": "Find Product",
          "orders": "Orders",
          "price": "price",
          "country": "Country",
          "setting": "Setting",
          "balconies": "Number of Balconies",
          "language": "Language",
          "about": "About Us",
          "help": "Help",
          "delete": "Success Delete",
          "welcomeglus": "Welcome To Glu's Family",
          "signupmass": "Thank you for joining Glu's Family Have a nice day",
          "logout": "Log Out",
          "abouttextglus":
              """The Saudi Gulf Group was established 25 years ago in the city of Riyadh, Saudi Arabia as a group An Egyptian investment company consisting of a number of companies specialized in manufacturing and contracting General, restoration, operation and maintenance, a mixture of great experiences in the Egyptian market like other Arab markets.
          \nAs part of the company’s expansion plan in the fields of services, manufacturing and trade, the group launches its new product (Gloe). glu), which belongs to Glus, our leading company whose goal is to provide all services and products to take care of the needs of Egyptian family. Glu strives to fulfill their requirements with quality, efficiency and competitive prices through a large group Of hygiene and personal care products.
          \nOur goal is not only to provide our services and products in isolation from our customers, but we seek in a responsible manner and Taking into account the physical and social environment to provide all the necessary services and products for the comfort and happiness of our customers and partners in Success.
          \nWhen we launched the group, we developed an expanded strategy aimed at meeting the requirements of the Egyptian family through Achieving their needs for services and products with an integrated vision that makes their needs easier to meet and provides their comfort Smart and practical.
          \nWe hope that glu will complete our strategy and be an ambassador for our group, expressing our goals and ambitions, and conveying our message. In every Egyptian home, we are honored to be present with our services or products. """,
          "ph011": "011 48 400 177",
          "categories": "Categories",
          "products": "Products",
          "department": "Services",
          "total": "Total Price ",
          "success": "Order completed",
          "incart": "The Product in Cart ",
          "checkout": "CHECK OUT",
          "addcart": "Add to cart",
          "priceglus": "Price is Determined by Area",
          "count": "Can Not Be Less Than One",
          "cart": "There are no products in your shopping list!",
          "abouttextsg":
              """The Saudi Gulf Group was established 25 years ago in Riyadh Saudi Arabia, as an Egyptian-Saudi company specialized in the field of Contracting, restoration, finishing and maintenance works. It reached the second category with a business volume of 8 billion. We also offer our clients Architectural designs, structural designs, interior designs and decorations.
          \nWe have specialized personnel in this field such as civil engineers, management engineers and Maintenance engineers.
          \nThroughout our history, we have provided these services in the fields of project planning, construction and restoration, and we have implemented many projects including palaces, private villas, commercial centers, restaurants, cafeterias, hospitals, administrative offices, schools and public facilities. """,

          "click": "Click Here",
          "address": "Address",
          "addresshint": "Street - building - floor number - apartment",
          "delivery": "Delivery",
          "quantity": "Quantity",
          "deliverytime": "Delivery within 4 working days",
          "confirmorder": "Confirm Order",
          "shipping": "Cash",
          "shippingaddress": "Shipping Address",
          "electronicpayment": "Electronic Payment",
          "soon": "Soon !",
          "choosepaymentmethod": "Choose Payment Method",
          "requesttime": "Request time : ",
          "idorder": "Order number",
          "1":"Waiting...",
          "2":"Confirmed",
          "3":"Delivered",
          "4":"Prepared",
          "5":"Been completed",
          "0":"Was Canceled",
          "housekeeping": "House keeping",
          "calc": "Calculate the cleaning of your apartment",
          "room": "Numbers of Rooms",
          "calcbut": "Calculate",
          "addservice": "Service Request",
          "priceRoom": "Price Room",
          "successglus": "Your service has been requested",
          "type": "Package type",
          "notavailable": "Product not available",
          "notede": "Notes : ",
          "kitchen": "Kitchen Number",
          "policyReturn": "Policy Return",
          "bathroom": "Bathroom Number",
          "returnpolicy": """You can return the product if it is not on Glu’s list of returnable services, and if you received it in the following cases:
          
1 - An incorrect product (if the product has not been used and in its original proper packaging with all tags and labels included).

2 - If you change your mind or order a product by mistake, we will accept your return under the following specific terms:

  • The products are in their original packaging from the seller (closed and sealed box) and are not damaged or in poor condition. Packaging must be sealed and intact.
  • Returns will be accepted if the product is in its original packaging.

The amount will be returned to your Glus Store balance or to your credit card, while we check the products.
""",


        },
      };
}
