import 'package:flutter/material.dart';
import 'package:moneycollection/modules/splashScreen/splashscreen.dart';
import 'package:moneycollection/provider/app_provider.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
     DevicePreview(
      enabled: true, // This will enable device preview mode
      builder: (context) => const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: getProviders(),
      child: Consumer<ThemeModel>(
        builder: (context, appTheme, _) {
        return  ScreenUtilInit(
          designSize: const Size(360, 690), // Provide your design size here
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false, 
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const ViewSplashScreen(),
            );
          },
        );
        }
      ),
    );
  }
}

