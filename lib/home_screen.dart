import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notificationapp/notification_services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices services = NotificationServices();

  @override
  void initState() {
    super.initState();

    services.requestNotificationPermission();
    services.setupInteractMessage(context);
    services.firebaseInit(
      context,
    );
    services.isTokenRefresh();
    services.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('Token: $value');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification App'),
      ),
      body: Center(
          child: TextButton(
              onPressed: () {
                services.getDeviceToken().then((value) async {
                  var data = {
                    "to": services.deviceToken,
                    "priority": "high",
                    "notification": {
                      "title": "Flutter Notification",
                      "body": "Flutter Notification Body",
                    },
                    "data": {
                      "type": "msj",
                      "id": "1020",
                    }
                  };
                  await http.post(
                      Uri.parse('https://fcm.googleapis.com/fcm/send'),
                      body: jsonEncode(data),
                      headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                        'Authorization': 'key=${services.serverKey}'
                      });
                });
              },
              child: Text("Send Notfication"))),
    );
  }
}
