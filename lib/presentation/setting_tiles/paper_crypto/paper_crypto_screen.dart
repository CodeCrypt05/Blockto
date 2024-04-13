import 'package:blockto_app/presentation/setting_tiles/paper_crypto/paper_crypto_controller.dart';
import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:blockto_app/utils/validation/validation_mixin.dart';
import 'package:blockto_app/widget/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class PaperCryptoScreen extends StatelessWidget with ValidationsMixin {
  PaperCryptoScreen({super.key});

  final paperCryptoController = Get.find<PaperCryptoScreenController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20.h),
          child: Form(
            key: paperCryptoController.paperCryptoFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      BImages.usdtCoin,
                      fit: BoxFit.cover,
                      height: 30.h,
                      width: 30.h,
                    ),
                    SizedBox(width: 14.h),
                    Text(
                      "Buy Tether USDT",
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
                  controller: paperCryptoController.coinPriceController,
                  textAlignVertical: TextAlignVertical.bottom,
                  // hintText: "Enter your name",
                  textInputType: TextInputType.number,
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
                  onFieldSubmitted: (p0) {
                    if (paperCryptoController.paperCryptoFormKey.currentState!
                        .validate()) {
                      paperCryptoController.addCointoPortfolio(
                        "https://assets.coingecko.com/coins/images/325/large/Tether-logo.png",
                        'Tether USDt',
                        'USDT',
                        0.0,
                        double.parse(
                            paperCryptoController.coinPriceController.text),
                        1.0,
                      );
                    }
                  },
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
              ],
            ),
          ),
        ),
      )),
    );
  }
}
