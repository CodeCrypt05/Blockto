import 'package:blockto_app/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(BImages.cryptoCard),
        ],
      ),
    );
  }
}
