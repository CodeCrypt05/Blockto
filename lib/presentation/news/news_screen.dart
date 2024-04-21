import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  // var newsData;
  const NewsScreen({super.key});

  String getCreatorText(dynamic creator) {
    if (creator is List) {
      // If creator is a list, join its elements
      return 'By ${creator.join(', ')}';
    } else if (creator != null) {
      // If creator is not null and not a list, just use it as is
      return 'By $creator';
    } else {
      // If creator is null, return an empty string or handle it as needed
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic newsData = Get.arguments;

    // String content = blog.content;
    // String firstWord = content.split(' ').first.characters.first;
    // String restOfContent = content.substring(firstWord.length);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsData.title,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(height: 12.h),
                // Text(
                //   getCreatorText(newsData.creator),
                //   style: TextStyle(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.white,
                //   ),
                // ),
                // SizedBox(height: 6.h),
                Text(
                  "${newsData.pubDate}",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.6)),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(newsData.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                SizedBox(height: 26.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${newsData.description}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      // TextSpan(
                      //   text: restOfContent,
                      // ),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w200,
                  ),
                )

                // Text(
                //   blog.content.isNotEmpty
                //       ? blog.content[0]
                //       : '', // First character
                //   style: TextStyle(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Text(
                //   blog.content.length > 1
                //       ? blog.content.substring(1)
                //       : '', // Rest of the content
                //   style: TextStyle(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
