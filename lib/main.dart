import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notificationapp/home_screen.dart';
import 'package:notificationapp/infinite_scroll.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(
      firebaseOnBackgroundNotificationHandler);
  runApp(const MyApp());
}

@pragma(
    'vm:entry-point') // This is required to prevent the function from being tree-shaken.
Future<void> firebaseOnBackgroundNotificationHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InfinitScroll(),
    );
  }
}
