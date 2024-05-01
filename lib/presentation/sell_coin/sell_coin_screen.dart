import 'package:blockto_app/presentation/sell_coin/sell_coin_controller.dart';
import 'package:blockto_app/utils/components/loader.dart';
import 'package:blockto_app/utils/validation/validation_mixin.dart';
import 'package:blockto_app/widget/auth_button/auth_buttons.dart';
import 'package:blockto_app/widget/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SellCoin extends StatelessWidget with ValidationsMixin {
  SellCoin({super.key});

  final sellCoinController = Get.find<SellCoinController>();

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    double amount = arguments[0];
    print(arguments[1].toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20.h),
          child: Form(
            key: sellCoinController.sellCoinForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Row(
                  children: [
                    Image.network(
                      arguments[4],
                      fit: BoxFit.cover,
                      height: 30.h,
                      width: 30.h,
                    ),
                    SizedBox(width: 14.h),
                    Text(
                      "Sell Coin",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xffF5C249).withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),

                Text(
                  "You hold the coins : ${arguments[0].toInt()} ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffF5C249).withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Current market price : ${arguments[3]} ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffF5C249).withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Enter the coins ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffF5C249).withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 6.h),
                CustomTextField(
                  autofocus: true,
                  maxLines: 1,
                  controller: sellCoinController.sellCoinTextController,
                  textAlignVertical: TextAlignVertical.bottom,
                  // hintText: "Enter your name",
                  textInputType: TextInputType.number,
                  // prefixIcon: ,

                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffF5C249).withOpacity(0.6),
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffF5C249).withOpacity(0.8),
                  ),
                  validator: validatePrice,
                  onFieldSubmitted: (p0) {},
                ),
                SizedBox(height: 16.h),
                // Text(
                //   "Estimated price ~ ${10}",
                //   style: TextStyle(
                //     fontSize: 12.sp,
                //     fontWeight: FontWeight.w400,
                //     color: const Color(0xffF5C249).withOpacity(0.6),
                //   ),
                // ),
                AuthButton(
                  label: "Swap Coin",
                  icons: const Icon(
                    Icons.swap_horiz_sharp,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (int.parse(sellCoinController
                                .sellCoinTextController.text) <=
                            arguments[0].toInt() &&
                        sellCoinController.sellCoinForm.currentState!
                            .validate()) {
                      Loader.showLoader();
                      sellCoinController.sellCoins(
                          arguments[0], arguments[2], arguments[3]);
                      Get.back();
                    } else {
                      Get.snackbar(
                          "You are holding ${arguments[0].toInt()} ${arguments[1]} coins",
                          "Please enter valid value",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.red,
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
