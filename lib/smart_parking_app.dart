import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking/core/helper/shared_pref_keys.dart';
import 'package:smart_parking/core/routes/app_route.dart';
import 'package:smart_parking/core/routes/name_routes.dart';
import 'package:smart_parking/core/theme/theme_provider.dart';

class SmartParkingApp extends StatelessWidget {
  final AppRouter appRouter;
  const SmartParkingApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        // theme: ThemeData(
        //   useMaterial3: true,
        // ),
        //initialRoute: NameRoutes.pathSplash,
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: isLoggedInUser ? Routes.pathHome : Routes.pathLogin,
      ),
    );
  }
}
