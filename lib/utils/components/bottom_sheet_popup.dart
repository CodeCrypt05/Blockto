import 'package:blockto_app/widget/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomBottomSheetPopup {
  void showBottomSheetPopup({
    required BuildContext context,
    String ic = "",
    String title = "",
    String description = "",
    String leftButtonName = "",
    String rightButtonName = "",
    Color leftBtnBackgroundColor = Colors.transparent,
    Color rightBtnBackgroundColor = Colors.transparent,
    Color leftBorderColor = Colors.transparent,
    Color rightBorderColor = Colors.transparent,
    Color leftTextColor = Colors.black,
    Color rightTextColor = Colors.black,
    Color? leftBoxShadowColor,
    Color? rightBoxShadowColor,
    double leftButtonHeight = 40.0,
    double rightButtonHeight = 40.0,
    VoidCallback? saveActionButtonPressed,
    VoidCallback? cancelButtonPressed,
    bool? isShrink,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        if (isShrink == null) isShrink = false;
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 600),
          curve: Curves.elasticInOut,
          child: Container(
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: const Color(0xff10131B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              border: Border(
                top: BorderSide(
                  width: 1.5.h,
                  color: const Color(0xff272A31),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 44.h,
                          width: 44.h,
                          padding: ic.contains('.gif')
                              ? EdgeInsets.all(2.h)
                              : EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            color: Color(0xff1C1E26),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ic.contains('.gif')
                              ? Image.asset(
                                  ic,
                                  fit: BoxFit.cover,
                                )
                              : SvgPicture.asset(
                                  ic,
                                  fit: BoxFit.cover,
                                  height: 24.h,
                                  width: 24.h,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isShrink!
                        ? SizedBox.shrink()
                        : Expanded(
                            child: CustomButton(
                              height: leftButtonHeight,
                              label: leftButtonName,
                              textColor: leftTextColor,
                              backgroundColor: leftBtnBackgroundColor,
                              borderColor: leftBorderColor,
                              borderRaduis: 12.r,
                              boderWidth: 1.w,
                              boxShadowColor: leftBoxShadowColor,
                              fontSize: 16.sp,
                              onTap: cancelButtonPressed,
                            ),
                          ),
                    isShrink! ? SizedBox.shrink() : SizedBox(width: 16.w),
                    Expanded(
                      child: CustomButton(
                        height: rightButtonHeight,
                        label: rightButtonName,
                        textColor: rightTextColor,
                        backgroundColor: rightBtnBackgroundColor,
                        borderColor: rightBorderColor,
                        borderRaduis: 12.r,
                        boderWidth: 1.w,
                        boxShadowColor: rightBoxShadowColor,
                        fontSize: 16.sp,
                        onTap: saveActionButtonPressed,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 26.h),
              ],
            ),
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      isScrollControlled: true,
    );
  }
}
