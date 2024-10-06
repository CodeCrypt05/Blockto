import 'package:blockto_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsCard extends StatelessWidget {
  var item;
  final int index;
  NewsCard({super.key, this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.newsScreen,
          arguments: {'item': item, 'index': index}),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(18.r)),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.only(left: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: 'tag$index',
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(18.r),
                    image: DecorationImage(
                      image: NetworkImage(item.imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Container(
                // color: Colors.amberAccent.withOpacity(0.3),
                height: double.infinity,
                padding: EdgeInsets.only(top: 8.h, right: 6.w),
                child: Text(
                  item.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
