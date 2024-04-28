import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:svg_flutter/svg_flutter.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.containerBackColor,
    required this.assetColor,
    required this.typeImage,
  });

  final String title;
  final String subTitle;
  final Color containerBackColor;
  final Color assetColor;
  final String typeImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16.h),
          height: 90.h,
          decoration: BoxDecoration(
            color: containerBackColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              SizedBox(width: 48.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    const Spacer(),
                    Text(
                      subTitle,
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r)),
            child: SvgPicture.asset(
              BImages.bubbles,
              height: 48.h,
              width: 40.w,
              color: assetColor,
            ),
          ),
        ),
        Positioned(
          top: -12.h,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                BImages.back,
                height: 40.h,
                color: assetColor,
              ),
              Positioned(
                top: 10.h,
                child: SvgPicture.asset(
                  typeImage,
                  height: 16.h,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
