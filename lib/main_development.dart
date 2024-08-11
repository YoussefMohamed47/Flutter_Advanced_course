import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/helpers/extentions.dart';
import 'package:flutter_complete_project/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_project/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  // To fix text being Hidden bug in flutter ScreenUtil in Release mode
  await ScreenUtil.ensureScreenSize();
  await checkUserLoggedIn();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkUserLoggedIn() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullorEmpty()) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
