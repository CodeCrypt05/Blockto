import 'package:blockto_app/presentation/pages/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDrawerWidget extends StatefulWidget {
  const AppDrawerWidget({
    super.key,
  });

  @override
  State<AppDrawerWidget> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawerWidget> {
  final controller = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.amber,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(18.w, 56.h, 0.w, 10.h),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 26.0,
                    backgroundImage: NetworkImage(
                      'https://www.nicepng.com/maxp/u2y3a9e6t4o0a9w7/',
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "hjkdshdu ujyw ",
                  ),
                  Text(
                    "jhon@gmail.com",
                  ) //circleAvata
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 60,
          // ),

          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: Text('Logout'.tr),
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
