// ignore_for_file: library_private_types_in_public_api
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/view/screen/login/presintation/otp_validate_screen.dart';
import 'package:expo_visitor/view/screen/splash/presentation/SplashScreen/SplashScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'view/screen/home_screen/domin/bottom_navigation_logic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        path: 'assets/translation',
        startLocale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        // assetLoader: const CodegenLoader(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (contex) => BottomNavigationBarProvider())
          ],
          child: const MyApp(),
        )),
  );
}

late bool lang;
Locale currentLocal = const Locale('ar');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale value) {
    setState(() {
      currentLocal = value;
      lang = currentLocal.languageCode == 'en';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: currentLocal,
          title: ' Age Visitors',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          home: SplashScreenView());
    });
  }
}
