import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/home_page.dart';

import '../fav_page/fav_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int curruntIndex = 0;
  List<Widget> bodyItem = [
    HomePage(),
    FavPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
