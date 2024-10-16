// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martline_admin/Provider/AdvertProvider.dart';
import 'package:provider/provider.dart';
import 'Pages/Verification.dart';
import 'Provider/AuthProvider.dart';
import 'SplashScreen.dart';
import 'constant/color.dart';
import 'dashboard.dart';


// String device_token = "";
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   print("Handling a background message: ${message.messageId}");
//   print(message);
//   const AndroidNotificationDetails androidNotificationDetails =
//   AndroidNotificationDetails('your channel id', 'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker');
//   const NotificationDetails notificationDetails =
//   NotificationDetails(android: androidNotificationDetails);
//   await flutterLocalNotificationsPlugin.show(
//       0, message.notification!.title, message.notification!.body, notificationDetails,
//       payload: 'item x');
//   // message.data["status"]
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
      MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
  ChangeNotifierProvider<AdvertService>(
  create: (context) => AdvertService(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//   FirebaseMessaging? _firebaseMessaging;
//
//   initFirebase() async {
//     await Firebase.initializeApp();
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();
//
//
//     _firebaseMessaging?.requestPermission();
//     _firebaseMessaging = FirebaseMessaging.instance;
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print(message);
//       const AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails('your channel id', 'your channel name',
//           channelDescription: 'your channel description',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker');
//       const NotificationDetails notificationDetails =
//       NotificationDetails(android: androidNotificationDetails);
//       await flutterLocalNotificationsPlugin.show(
//           0, message.notification!.title, message.notification!.body, notificationDetails,
//           payload: 'item x');
//     });
//
//
//     _firebaseMessaging!.getToken().then((token) async {
//
//
//       void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
//         final String? payload = notificationResponse.payload;
//         if (notificationResponse.payload != null) {
//           debugPrint('notification payload: $payload');
//         }
//         // await Navigator.push(
//         //   context,
//         //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
//         // );
//       }
//
//       print('Device Token FCM: $token');
//       print('Device Token FCM: $token');
//       print('Device Token FCM: $token');
//       print('Device Token FCM: $token');
//       device_token = token.toString();
//
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//       const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//       final LinuxInitializationSettings initializationSettingsLinux =
//       LinuxInitializationSettings(
//           defaultActionName: 'Open notification');
//       final InitializationSettings initializationSettings = InitializationSettings(
//           android: initializationSettingsAndroid,
//           linux: initializationSettingsLinux);
//       await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//           onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//     });
//
//
//   }

  @override
  void initState() {
    super.initState();
    // initFirebase();

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: primiryClr.withOpacity(0.8)),
        ),
        home: SplashScreen());
  }
}
