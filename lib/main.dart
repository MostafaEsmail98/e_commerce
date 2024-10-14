import 'package:device_preview/device_preview.dart';
import 'package:e_commrece/core/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'bloc_observer.dart';
import 'core/database/cache/cache_helper.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(CacheHelper.myBox);
  runApp(DevicePreview(
    builder: (BuildContext context) => const MyApp(),
    enabled: !kReleaseMode,
  ));
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
