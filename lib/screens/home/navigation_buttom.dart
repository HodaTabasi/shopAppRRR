import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rrr_shop_app/screens/home/tebs/cart_tab/cart_page.dart';
import 'package:rrr_shop_app/screens/home/tebs/fav_tab/fav_screen.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/home_page.dart';
import 'package:rrr_shop_app/screens/home/tebs/order_tab/order_page.dart';
import 'package:rrr_shop_app/screens/home/tebs/profile_tab/profile_Page.dart';
import 'package:rrr_shop_app/utils/helper.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int curruntIndex = 0;
  List<Widget> bodyItem = [
    HomePage(),
    FavPage(),
    CartPage(),
    OrderPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff474340),
      body: ZoomDrawer(
        clipMainScreen: true,
        style: DrawerStyle.defaultStyle,
        angle: 0,
        androidCloseOnBackTap: true,
        isRtl: true,
        mainScreen: Scaffold(
          body: bodyItem[curruntIndex],
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: curruntIndex,
            onDestinationSelected: (value) {
              setState(() {
                curruntIndex = value;
              });
            },
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset("assets/images/home.svg"),
                label: 'home',
              ),
              NavigationDestination(
                icon: SvgPicture.asset("assets/images/fav.svg"),
                label: 'fav',
              ),
              NavigationDestination(
                icon: SvgPicture.asset("assets/images/cart.svg"),
                label: 'cart',
              ),
              NavigationDestination(
                icon: SvgPicture.asset("assets/images/order.svg"),
                label: 'order',
              ),
              NavigationDestination(
                  icon: SvgPicture.asset("assets/images/profile.svg"),
                  label: 'profile'),
            ],
          ),
        ),
        menuScreen: MenuScreen(),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff474340),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SvgPicture.asset("assets/images/60_60.svg"),
          getSpace(h: 16.h),
          Text("cat",style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,).tr()
        ],
      ),
    );
  }

}
