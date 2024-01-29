
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:belajar_riverpod/config/routes/core_router.dart';

class MyApp extends ConsumerWidget{
  MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlavorBanner(
      child: MaterialApp.router(
        title: 'KIMIA',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        routeInformationProvider: coreRouter.routeInformationProvider,
        routeInformationParser: coreRouter.routeInformationParser,
        routerDelegate: coreRouter.routerDelegate,
        backButtonDispatcher: coreRouter.backButtonDispatcher,
        debugShowCheckedModeBanner: false,
        
      ),
    );
    
  }

}