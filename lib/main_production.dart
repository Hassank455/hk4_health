import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hk4_health/core/di/dependency_injection.dart';
import 'package:hk4_health/core/helpers/constants.dart';
import 'package:hk4_health/core/helpers/extensions.dart';
import 'package:hk4_health/core/helpers/shared_pref_helper.dart';
import 'package:hk4_health/core/routing/app_router.dart';
import 'package:hk4_health/hk4_health_app.dart';

//dart run build_runner build  --delete-conflicting-outputs
// flutter run --release -t lib/main_production.dart --flavor Production
// flutter build apk --flavor Production -t lib/main_production.dart 

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
   await checkIfLoggedInUser();
  runApp(Hk4HealthApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
