import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WideButtonWidget extends StatelessWidget {
  const WideButtonWidget({
    this.buttonTitle = '',
    super.key,
  });

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      decoration: BoxDecoration(
        color: Color(0xffDB8C09),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
              color: const Color(0xffDB8C09).withOpacity(0.4),
              spreadRadius: -0.7.h,
              offset: const Offset(0, 5))
        ],
      ),
      child: Center(
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }
}
