import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rrr_shop_app/controller/get/all_binding_controller.dart';
import 'package:rrr_shop_app/controller/hive/hice_operations.dart';
import 'package:rrr_shop_app/screens/cat_product/cat_product_screen.dart';
import 'package:rrr_shop_app/screens/complete_order/complete_order_screen.dart';
import 'package:rrr_shop_app/screens/complete_order/google_map_location.dart';
import 'package:rrr_shop_app/screens/fillter/fillter_page.dart';
import 'package:rrr_shop_app/screens/home/navigation_buttom.dart';
import 'package:rrr_shop_app/screens/login_screen.dart';
import 'package:rrr_shop_app/screens/otp/otp_screen.dart';
import 'package:rrr_shop_app/screens/product_details/product_details.dart';
import 'package:rrr_shop_app/screens/setting/setting_screen.dart';
import 'package:rrr_shop_app/screens/splach_screen.dart';
import 'package:rrr_shop_app/utils/l10n1.dart';

import 'controller/get/api_auth_getx_controller.dart';
import 'controller/get/api_getx_controller.dart';
import 'controller/get/hive_getx_controller.dart';
import 'controller/get/languages_getx_controoler.dart';
import 'controller/get/loading_getx_controller.dart';
import 'controller/preferences/shared_pref_controller.dart';
import 'screens/complete_profile/complete_profile.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefController().initPref();
  await HiveOperations().openBox();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
        supportedLocales: L10n.all,
        path: 'assets/l10n',
        // <-- change the path of the translation files
        fallbackLocale: L10n.all[1],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {

  LanguageGETXController controller = Get.put<LanguageGETXController>(LanguageGETXController());
  APIGetxController controller1 = Get.put<APIGetxController>(APIGetxController());
  AuthGETXController controller2 = Get.put<AuthGETXController>(AuthGETXController());
  LoadingController controller3 = Get.put<LoadingController>(LoadingController());
  HiveGetXController controller4 = Get.put<HiveGetXController>(HiveGetXController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetBuilder<LanguageGETXController>(
            builder: (controller){
              // context.setLocale(Locale(controller.language));
              return MaterialApp(
              // initialBinding: AllBindingController(),
              // smartManagement: SmartManagement.full,
              title: 'Flutter Demo',
              theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'avenir'),

              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              initialRoute: '/splash_screen',
              // home: FillterScreen(),
              routes: {
                '/splash_screen': (context) => SplashScreen(),
                '/login_screen': (context) => LoginScreen(),
                '/otp_screen': (context) => OTPScreen(),
                '/complete_screen': (context) => CompleteProfile(),
                '/main_screen': (context) => MainScreen(),
                '/complete_buy_screen': (context) => CompleteOrderScreen(),
                '/setting_screen': (context) => SettingScreen(),
                '/product_details_screen': (context) => ProductDetails(),
                '/cart_product_screen': (context) => CatProductScreen(),
                '/fillter_screen': (context) => FillterScreen(),
                '/map_screen': (context) => GoogleMapLcationPage(),
              },
            );
            }
          );
        });
  }

/*
  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const HomePage(title: 'First Method'),
    );
   */
}
