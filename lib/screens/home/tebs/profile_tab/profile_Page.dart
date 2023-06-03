import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/screens/home/tebs/profile_tab/setting_item.dart';
import 'package:rrr_shop_app/screens/home/tebs/profile_tab/suppourt_sheet.dart';
import 'package:rrr_shop_app/screens/login_screen.dart';
import 'package:rrr_shop_app/utils/helper.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../controller/data/model/user.dart';
import '../../../../controller/get/api_auth_getx_controller.dart';
import '../../../../controller/preferences/shared_pref_controller.dart';
import '../../../../utils/constants.dart';
import 'custom_dialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User u;

  @override
  void initState() {
    u = SharedPrefController().user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        toolbarHeight: 60.h,
        title: const Text(
          "profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(
                    u.profileImage != null?"${APISetting.IMAGE_BASE_URL}${u.profileImage}":"https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80"),
              ),
              trailing: InkWell(
                onTap: () {
                  AuthGETXController.to.flag = true;
                  Navigator.pushNamed(context, '/complete_screen');
                },
                child: SvgPicture.asset("assets/images/editprofile.svg"),
              ),
              title: Text(
                u.name ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              subtitle: Text(
                u.phoneNumber.toString(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
            getSpace(h: 80.h),
            SettingItem(
              title: "share",
              iconName: "share.svg",
              onClick: () {
                Share.share('check out my website https://example.com');
              },
            ),
            SettingItem(
              title: "support",
              iconName: "support.svg",
              onClick: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    context: context,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Colors.transparent)),
                    builder: (context) => SuppourtSheet());
              },
            ),
            SettingItem(
              title: "setting",
              iconName: "Setting.svg",
              onClick: () {
                Navigator.pushNamed(context, '/setting_screen');
              },
            ),
            SettingItem(
              title: "logout",
              iconName: "Logout.svg",
              deleteArrows: true,
              onClick: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CoustomDialog(
                        onClick: () {
                          SharedPrefController().clear();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                                  (route) => false);
                        },
                        title: "out",
                        image: "ddd.svg",
                      );
                    });
              },
            ),
            SettingItem(
              title: "delete_account",
              iconName: "delete_account.svg",
              deleteArrows: true,
              onClick: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CoustomDialog(
                        onClick: () async {
                          ApiResponse response = await AuthGETXController.to
                              .deleteUser(phone: u.phoneNumber!);
                          if (response.success) {
                            SharedPrefController().clear();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          }else {
                            showSnackBar(context: context,message: response.message,error: !response.success);
                          }
                        },
                        title: "delete",
                        image: "ff.svg",
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
