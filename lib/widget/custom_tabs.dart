import 'package:blockto_app/presentation/pages/market/market_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabsBar extends StatefulWidget {
  const CustomTabsBar({
    super.key,
    required this.marketController,
  });

  final MarketPageController marketController;

  @override
  State<CustomTabsBar> createState() => _CustomTabsBarState();
}

class _CustomTabsBarState extends State<CustomTabsBar> {
  final List items = [
    "All",
    "Watchlist",
    // "Top gainers",
    // "Top lossers",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              widget.marketController.position.value = index;
            },
            child: Padding(
              padding: widget.marketController.position.value == index
                  ? EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.h)
                  : EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: widget.marketController.position.value == index
                          ? Color.fromARGB(15, 0, 0, 0)
                          : Colors.transparent,
                      offset: Offset(0, 9),
                      blurRadius: 19,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                  color: widget.marketController.position.value == index
                      ? Color(0xffF5C249)
                      : Colors.grey.withOpacity(0.2),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.center,
                child: Text(
                  items[index],
                  style: GoogleFonts.roboto(
                    color: widget.marketController.position.value == index
                        ? Colors.black.withOpacity(0.8)
                        : Color(0xffC5C5C5),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
