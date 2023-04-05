import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/utils/app_colors.dart';
import 'package:technical_test/utils/app_constants.dart';
import 'package:technical_test/utils/navigation_routes.dart';
import 'package:technical_test/core/services/dependency_injection.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.alegreyaTextTheme(),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      //Todo Routes settings
      initialRoute: Routes.kSplashView,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
