import 'package:blockto_app/data/local_storage/local_storage.dart';
import 'package:blockto_app/presentation/pages/settings/settings_page_controller.dart';
import 'package:blockto_app/presentation/setting_tiles/paper_crypto/paper_crypto_controller.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/utils/components/bottom_sheet_popup.dart';
import 'package:blockto_app/utils/constants/colors.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final settingPageController = Get.find<SettingPageController>();
  final paperCryptoScreenController = Get.find<PaperCryptoScreenController>();

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      "The link will be provided in feature",
      sharePositionOrigin: box!.localToGlobal(Offset.infinite) & box.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isChange = storage.read('isChange') ?? false;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.amberAccent,
                  backgroundImage: AssetImage(BImages.imgProfile),
                ),
                SizedBox(width: 26.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      settingPageController.name.value.toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      settingPageController.email.value.toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 40.h),
            Text(
              'Persnol',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),
            settingTile(Icons.person_3_outlined, 'Edit Profile', () {}, false),

            Divider(color: Colors.grey.withOpacity(0.2), thickness: 1.4),

            settingTile(
                Icons.lock_open_rounded, 'Change Password', () {}, false),
            //----------------------------------------------------------------
            SizedBox(height: 26.h),
            Text(
              'Other',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),

            settingTile(Icons.attach_money, 'Paper Crypto', () {
              if (isChange) {
              } else {
                Get.toNamed(AppRoutes.paperCryptoScreen);
              }
            }, isChange),
            Divider(color: Colors.grey.withOpacity(0.2), thickness: 1.4),

            settingTile(Icons.info_outline_rounded, 'About Us', () {}, false),

            Divider(color: Colors.grey.withOpacity(0.2), thickness: 1.4),

            settingTile(
                Icons.share, 'Share the app', () => _onShare(context), false),
            //----------------------------------------------------------------
            SizedBox(height: 26.h),
            Text(
              'Action',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 14.h),
            settingTile(Icons.logout_outlined, 'Logout', () {
              CustomBottomSheetPopup().showBottomSheetPopup(
                context: context,
                ic: BImages.logoutIc,
                title: "Logout?",
                description: "Are you sure you want to logout of the app? ",
                leftButtonName: "No, go back",
                rightButtonName: "Logout",
                leftBtnBackgroundColor: Colors.transparent,
                rightBtnBackgroundColor: TColors.secondary,
                leftBorderColor: Colors.grey.withOpacity(0.4),
                rightBorderColor: Colors.transparent,
                leftTextColor: TColors.white,
                rightTextColor: TColors.black,
                leftBoxShadowColor: Colors.transparent,
                rightBoxShadowColor: TColors.secondary.withOpacity(0.6),
                leftButtonHeight: 53.h,
                rightButtonHeight: 50.h,
                saveActionButtonPressed: () async {
                  Get.back();
                  await settingPageController.signOut();
                },
                cancelButtonPressed: () {
                  Get.back();
                },
              );
            }, false),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  Widget settingTile(
      IconData icons, String label, VoidCallback onPressed, bool isChange) {
    return InkWell(
      onTap: onPressed,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icons,
                  size: 20.h,
                  color: isChange ? Colors.grey : Colors.white,
                ),
                SizedBox(width: 14.h),
                Text(
                  label,
                  style: TextStyle(
                    color: isChange ? Colors.grey : Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.h,
              color: isChange ? Colors.grey : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
