import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hk4_health/core/routing/app_router.dart';
import 'package:hk4_health/core/routing/routes.dart';
import 'package:hk4_health/core/theming/colors.dart';

class Hk4HealthApp extends StatelessWidget {

final AppRouter appRouter;

  const Hk4HealthApp({super.key,required this.appRouter});



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Hk4 Health App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
      )
    );
  }
}