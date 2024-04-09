import 'package:blockto_app/firebase_options.dart';
import 'package:blockto_app/presentation/home_page/home_screen.dart';
import 'package:blockto_app/presentation/home_page/home_screen_binding.dart';

import 'package:blockto_app/presentation/signin/signin_screen.dart';
import 'package:blockto_app/presentation/signin/signin_screen_binding.dart';

import 'package:blockto_app/routes/app_page.dart';
import 'package:blockto_app/routes/app_routes.dart';
import 'package:blockto_app/utils/themes/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // initialRoute: AppRoutes.signinScreen,
        getPages: AppPages.getPages,
        initialBinding: SignInScreenBinding(),
        themeMode: ThemeMode.system,
        theme: ThemeData.dark(),
        darkTheme: TAppTheme.darkTheme,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return const SignInScreen();
          },
        ),
      ),
    );
  }
}
