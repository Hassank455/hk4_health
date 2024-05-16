import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hk4_health/core/di/dependency_injection.dart';
import 'package:hk4_health/core/routing/app_router.dart';
import 'package:hk4_health/hk4_health_app.dart';

void main() async{
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(Hk4HealthApp(appRouter: AppRouter()));
}
