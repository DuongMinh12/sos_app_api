import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warning_app/routes.dart';

import 'cubit/wrapProvider.dart';
import 'screens/screens.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(WrapProvider(child:  MaterialApp(
    initialRoute: SplashPage.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
    // home: SplashPage(),
    //theme: ThemeData(),
  )));
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       initialRoute: HomePage.routeName,
//       routes: routes,
//       debugShowCheckedModeBanner: false,
//
//     );
//   }
// }
