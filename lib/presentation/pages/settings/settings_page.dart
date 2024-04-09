import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              ),
              SizedBox(width: 26.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jhon Wick',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'jhonwick@gmail.com',
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
          settingTile(Icons.person_3_outlined, 'Edit Profile'),

          Divider(
            color: Colors.grey.withOpacity(0.2),
            thickness: 1.4,
          ),

          settingTile(Icons.lock_open_rounded, 'Change Password'),
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
          settingTile(Icons.info_outline_rounded, 'About Us'),

          Divider(
            color: Colors.grey.withOpacity(0.2),
            thickness: 1.4,
          ),

          settingTile(Icons.share, 'Share the app'),
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
          settingTile(Icons.logout_outlined, 'Logout'),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget settingTile(IconData icons, String label) {
    return InkWell(
      onTap: () {},
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
                  color: Colors.white,
                ),
                SizedBox(width: 14.h),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.h,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
