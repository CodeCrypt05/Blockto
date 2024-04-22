import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:svg_flutter/svg_flutter.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                BImages.emptyNotification,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 18.sp),
              Text(
                'No Notification',
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffDB8C09),
                ),
              ),
              SizedBox(height: 12.sp),
              Text(
                "You haven't received any \nnotification yet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
