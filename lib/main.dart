import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pawscare/screens/ServiceListScreen.dart';
import 'package:pawscare/screens/PetListScreen.dart';
import 'firebase_options.dart';
import 'package:pawscare/screens/AuthScreen.dart';
import 'package:pawscare/screens/RoleScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const AuthScreen(isLogin: true),
        '/register': (context) => const AuthScreen(isLogin: false),
        '/role': (context) => RoleScreen(),
        '/serviceList': (context) => ServiceListScreen(),
        '/petList': (context) => PetListScreen(),

      },
    );
  }
}
