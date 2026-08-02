import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/resources/app_theme.dart';
import 'core/resources/routes_manager.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'features/search/presentation/cubit/search_cubit.dart';
import 'features/search/presentation/screen/search_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
    configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routes: {
            RoutesManager.homeRouteName:(_)=>HomeScreen(),
            RoutesManager.searchRouteName:(context)=>BlocProvider(
              create: (context) => SearchCubit(),
                child: SearchScreen()),
          },
          initialRoute: RoutesManager.homeRouteName,
        );
      },
    );
  }
}


