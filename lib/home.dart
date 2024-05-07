import 'package:overlay_support/overlay_support.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:virtam/push_notification.dart';
import 'package:virtam/specific_screen.dart';

import 'firebase_options.dart';
Future <void> _firebaseMessagingBackgroundHandler (RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PushNotification? _notificationInfo;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final FCM =  _messaging.getToken();
    print(FCM);

    registerNotification();
    checkForInitialMessage();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification click when app is in background or terminated
      handleNotification(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
              // Handle notification click when app is in background or terminated
              handleNotification(message);
            });
          },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _notificationInfo != null ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_notificationInfo!.title}'),
                const SizedBox(height: 30,),
                Text('${_notificationInfo!.body }'),
              ],
            ) :
            const Center(child: Text('No Notification'))
          ],
        ),
      ),
    );
  }



  void registerNotification() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // when i press where should i go :
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificScreen()));
    });
    NotificationSettings notificationSettings = await _messaging
        .requestPermission(
      alert: true,
      badge: true,
      provisional: true,
      sound: true,
    );


    final FCM = await _messaging.getToken();
    print(FCM);
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print('permission granted');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificScreen()));

        // this is where the content of the screen show when i press in the notification
        PushNotification notification = PushNotification(

          title: 'tte',
          body: 'ggg',
        );

        print('${message.notification?.title}');
        setState(() {
          _notificationInfo = notification;
        });
        if (_notificationInfo != null)  {
          // this is where the content of the  the notification when open app
          showSimpleNotification(
            Text('test'),
            subtitle: Text('hello , this is my test'),
            background: Colors.grey[600],
            duration: const Duration(seconds: 5),
          );
        } else {
          print('permission declined');
        }
      });
    }
  }
  void handleNotification(RemoteMessage message) {
    // Extract custom data from the message
    String? screen = message.data['screen'];

    if (screen == 'specific_screen') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificScreen()));
    }
  }
  checkForInitialMessage () async{
    await Firebase.initializeApp();
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null){
      PushNotification notification = PushNotification(

        title: 'iam in my way',
        body: 'be ready',

      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SpecificScreen()));

      setState(() {
        _notificationInfo = notification;
      });
    }

  }

}
