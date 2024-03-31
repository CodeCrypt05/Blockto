import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomAppbarWidget extends StatelessWidget {
  const BottomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.black,
      color: Colors.black,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: 30.h,
                color: Colors.white.withOpacity(0.8),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.swap_horizontal_circle_outlined,
                size: 30.h,
                color: Colors.white.withOpacity(0.8),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
                size: 30.h,
                color: Colors.white.withOpacity(0.8),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
