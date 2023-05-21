import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rrr_shop_app/controller/data/model/user.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/screens/complete_profile/done_registration_sheet.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../controller/data/api/api_response.dart';
import '../../controller/get/api_auth_getx_controller.dart';
import '../../controller/get/loading_getx_controller.dart';
import '../../core/app_text_filed.dart';
import 'complete_widget.dart';

class CompleteProfile extends StatefulWidget {
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _idController;
  late TextEditingController _birthdayController;



  @override
  void initState() {
    if (AuthGETXController.to.flag) {
      User u = SharedPrefController().user;
      _nameController = TextEditingController(text: u.name);
      _emailController = TextEditingController(text: u.email);
      _idController = TextEditingController(text: u.idNumber.toString());
      _birthdayController = TextEditingController(text: u.dateOfBirth);
      u.gender == "male"
          ? AuthGETXController.to.groupValue.value = 1
          : AuthGETXController.to.groupValue.value = 2;
      AuthGETXController.to.phoneNumber = u.phoneNumber.toString();
    } else {
      _nameController = TextEditingController();
      _emailController = TextEditingController();
      _idController = TextEditingController();
      _birthdayController = TextEditingController();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            AuthGETXController.to.flag ? "update" : "complete",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp),
          ).tr(),
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 80,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ))),
      body: Obx(() {
        return ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            buildStack(context),
            AppTextFiled(
              title: 'name',
              icon: Icons.person,
              hint: data.tr('enter_name'),
              controller: _nameController,
            ),
            AppTextFiled(
              title: 'email',
              icon: Icons.email,
              // hint: 'enter_email'.tr(),
              hint: data.tr('enter_email'),
              controller: _emailController,
            ),
            AppTextFiled(
              title: 'id',
              icon: Icons.art_track,
              hint: data.tr('enter_id'),
              controller: _idController,
            ),
            AppTextFiled(
              title: 'date',
              icon: Icons.calendar_month,
              hint: data.tr('enter_date'),
              controller: _birthdayController,
              readOnly: true,
            ),
            Text(
              "gender",
              style: TextStyle(
                  color: Color(0xff6E6E6F),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200),
            ).tr(),
            getSpace(h: 16.h),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.grey, width: 0.6)),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSelectedGender(context, "male", Icons.male, 1, (val) {
                      AuthGETXController.to.changeValue(val);
                    }),
                    VerticalDivider(color: Colors.grey, thickness: 0.6),
                    buildSelectedGender(context, "female", Icons.female, 2,
                        (val) {
                      AuthGETXController.to.changeValue(val);
                    }),
                  ],
                ),
              ),
            ),
            getSpace(h: 8.h),
            BtnApp(title: data.tr("save"), prsee: () => _performRegister())
          ],
        );
      }),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _idController.text.isNotEmpty &&
        _birthdayController.text.isNotEmpty) {
      return true;
    }

    showSnackBar(
        context: context, message: 'Enter required data!', error: true);
    return false;
  }

  User get user {
    User u = User();
    u.name = _nameController.text;
    u.idNumber = int.parse(_idController.text);
    u.phoneNumber = int.parse(AuthGETXController.to.phoneNumber);
    u.email = _emailController.text;
    u.dateOfBirth = _birthdayController.text;
    u.gender = AuthGETXController.to.groupValue.value == 1 ? "male" : "female";
    u.lang = SharedPrefController().getValueFor(key: PrefKeys.lang.name);
    u.token = SharedPrefController().token;
    print(SharedPrefController().token);
    return u;
  }

  Future<void> _register() async {
    LoadingController.to.changeLoading(true);
    late ApiResponse isSucess;
    if(AuthGETXController.to.flag){
      if(APIGetxController.to.picke.value.path.isEmpty){
        isSucess = await AuthGETXController.to.updateUser(user: user);
      }else {
        isSucess = await AuthGETXController.to.updateUserWithImage(path:APIGetxController.to.picke.value.path,user: user);
      }

    }else{
      if(APIGetxController.to.picke.value.path.isEmpty){
        isSucess = await AuthGETXController.to.register(user: user);
      }else {
        isSucess = await AuthGETXController.to.registerWithImage(path:APIGetxController.to.picke.value.path,user: user);
      }
    }

    LoadingController.to.changeLoading(false);

    if (isSucess.success ) {
      if(!AuthGETXController.to.flag){
        showModalBottomSheet(
            isScrollControlled: false,
            backgroundColor: Colors.white,
            context: context,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Colors.transparent)),
            builder: (context) => DoneRegisterSheet());
      }
      showSnackBar(context: context, message: isSucess.message, error: false);

    } else {
      showSnackBar(context: context, message: isSucess.message, error: true);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _idController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }
}
