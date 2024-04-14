import 'package:blockto_app/presentation/swap/swap_screen_controller.dart';
import 'package:blockto_app/utils/validation/validation_mixin.dart';
import 'package:blockto_app/widget/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SwapCoinScreen extends StatelessWidget with ValidationsMixin {
  SwapCoinScreen({
    super.key,
  });

  final swapCoinController = Get.find<SwapCoinScreenController>();

  @override
  Widget build(BuildContext context) {
    final dynamic item = Get.arguments;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20.h),
        child: Form(
          key: swapCoinController.swapCoinFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.h),
              Row(
                children: [
                  Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    height: 30.h,
                    width: 30.w,
                  ),
                  SizedBox(width: 14.h),
                  Text(
                    item.name.toString(),
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
                "I want to get",
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
                controller: swapCoinController.swapCoinController,
                textAlignVertical: TextAlignVertical.bottom,
                // hintText: "Enter your name",
                textInputType: TextInputType.number,
                onChanged: (value) {
                  // Update inputValue whenever the text field changes
                  swapCoinController.inputValue.value = int.parse(value);
                  // Call calculateResult after debounce duration
                },
                // prefixIcon: ,
                suffixIcon: Container(
                  width: double.minPositive,
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.attach_money,
                    size: 20.h,
                    color: const Color(0xffF5C249).withOpacity(0.8),
                  ),
                ),
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
                // onFieldSubmitted: (p0) {
                //   if (swapCoinController.swapCoinFormKey.currentState!
                //       .validate()) {
                //     swapCoinController.addCointoPortfolio(
                //       "https://assets.coingecko.com/coins/images/325/large/Tether-logo.png",
                //       'Tether USDt',
                //       'usdt',
                //       0.0,
                //       double.parse(swapCoinController.coinPriceController.text),
                //       1.0,
                //     );
                //   }
                // },
              ),
              SizedBox(height: 16.h),
              Obx(
                () => Text(
                  "Estimated price ~ ${10}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffF5C249).withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
