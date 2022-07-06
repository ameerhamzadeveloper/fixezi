import 'package:fixezi/provider/job_search_provider.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/provider/user_job_provider.dart';
import 'package:fixezi/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('A bg message just showed up :  ${message.messageId}');
// }
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider<JobSearchProvider>(
          create: (context) => JobSearchProvider(),
        ),
        ChangeNotifierProvider<TradieJobsProvider>(
          create: (context) => TradieJobsProvider(),
        ),
        ChangeNotifierProvider<UserJobProvider>(
          create: (context) => UserJobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Fixezi',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
              centerTitle: true,
              titleTextStyle: GoogleFonts.poppins(color: Colors.white,fontSize: 22),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
            ),
            scaffoldBackgroundColor: const Color(0xff282828),
            textTheme: TextTheme(
              bodyText1: GoogleFonts.poppins(color: Colors.white),
              bodyText2: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
          home: const SplashScreen()
      ),
    );
  }
}
