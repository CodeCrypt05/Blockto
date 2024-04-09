import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedCoinBottomAppbarWidget extends StatelessWidget {
  const SelectedCoinBottomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.grey.withOpacity(0.6),
      color: Colors.grey.withOpacity(0.2),
      child: Container(
        height: kBottomNavigationBarHeight,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '0.0000 BTC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '~\$0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Container(
              height: 50.h,
              width: 90.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffF5C249),
                  borderRadius: BorderRadius.circular(18.r)),
              child: Text(
                'Buy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
