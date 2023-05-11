import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/hive/hice_operations.dart';
import 'package:rrr_shop_app/screens/home/tebs/cart_tab/cart_page.dart';
import 'package:rrr_shop_app/screens/home/tebs/fav_tab/fav_screen.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/home_page.dart';
import 'package:rrr_shop_app/screens/home/tebs/order_tab/order_page.dart';
import 'package:rrr_shop_app/screens/home/tebs/profile_tab/profile_Page.dart';
import 'package:rrr_shop_app/utils/constants.dart';
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
          backgroundColor: background,
          body: bodyItem[curruntIndex],
          bottomNavigationBar:Container(
            margin: EdgeInsets.symmetric(horizontal: 8.r,vertical: 10.r),
            //add ClipRRect widget for Round Corner
           decoration: BoxDecoration(
             borderRadius:  const BorderRadius.only(
               topRight: Radius.circular(50),
               topLeft: Radius.circular(50),
               bottomLeft: Radius.circular(50),
               bottomRight: Radius.circular(50),
             ),
             boxShadow: [
               BoxShadow(
                 color: Color(0xffE9E9E9),
                 blurRadius: 5,
                 spreadRadius: 2
               )
             ]
           ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child:  BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                currentIndex: curruntIndex,
                onTap: (value) {
                  setState(() {
                    curruntIndex = value;
                  });
                },
                // height: 54.h,
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                // surfaceTintColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/home.svg"),
                    activeIcon: SvgPicture.asset("assets/images/home_select.svg"),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/fav.svg"),
                    activeIcon: SvgPicture.asset("assets/images/fav_select.svg"),
                    label: 'fav',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/cart.svg"),
                    activeIcon: SvgPicture.asset("assets/images/cart_select.svg"),
                    label: 'cart',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/images/order.svg"),
                    activeIcon: SvgPicture.asset("assets/images/order_select.svg"),
                    label: 'order',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/images/profile.svg"),
                      activeIcon: SvgPicture.asset("assets/images/person_select.svg"),
                      label: 'profile'),
                ],
              ),
            ),
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
