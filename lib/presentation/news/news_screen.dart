import 'package:blockto_app/data/network/network_service.dart';
import 'package:blockto_app/presentation/no_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  // var newsData;
  NewsScreen({super.key});

  final networkController = Get.find<NetworkService>();

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final item = args['item'];
    final index = args['index'];

    // String content = blog.content;
    // String firstWord = content.split(' ').first.characters.first;
    // String restOfContent = content.substring(firstWord.length);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(
          () => networkController.connectionStatus.value == 1
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
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
                          "${item.pubDate}",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6)),
                        ),
                        SizedBox(height: 16.h),
                        Hero(
                          tag: 'tag$index',
                          child: Container(
                            height: 200.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              image: DecorationImage(
                                image: NetworkImage(item.imageUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 26.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${item.description}',
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
                )
              : const NoInternetConnection(),
        ),
      ),
    );
  }
}
