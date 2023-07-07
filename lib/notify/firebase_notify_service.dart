import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifyService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<bool> initFirebaseNotification() async{
    // Request permission
    var settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Get the FCM token and save to storage
    final fcmToken = await _firebaseMessaging.getToken();
    // log("Token: $fcmToken");

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.fcmToken, fcmToken!);

    // Handle background message callback
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    final AuthorizationStatus result = settings.authorizationStatus;
    
    if(result == AuthorizationStatus.authorized){
      return true;
    }else{
      return false;
    }
  }
}

// Background callback handler
Future<void> handleBackgroundMessage(RemoteMessage message) async{
  log("\nTitle: ${message.notification?.title}");
  log("\nBody: ${message.notification?.body}");
  log("\nPayload: ${message.data}");
}