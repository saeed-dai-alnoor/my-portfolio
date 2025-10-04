import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_portfolio/app/modules/projects/controllers/projects_controller.dart';

import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'app/translations/app_translations.dart';

void main() {
  Get.put(SplashController());
  Get.put(ProjectsController());
  runApp(
    GetMaterialApp(
      title: 'Saeed Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Light / Dark حسب إعداد النظام

      translations: AppTranslations(), // تعريب ودعم الإنجليزية
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
