import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'library.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  debugPaintSizeEnabled = false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pictr this',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        'tutorial_page':(context) => const TutorialPage(),
        'login_page':(context)=>  const LoginPage(),
        'front_page':(context)=> const FrontPageP(),
      },
    ),


  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const FrontPageP();
  }
}
