import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/home.dart';
import 'package:virtam/notifications.dart';
import 'package:virtam/option1_3_screen/option1_3_screen.dart';
import 'package:virtam/option1_3_screen/option1_3_view_model.dart';
import 'package:virtam/push_notification.dart';
import 'package:virtam/register_screen/purpose_screen.dart';
import 'package:virtam/register_screen/register_screen.dart';
import 'package:virtam/splash_Screen/Splash_Screen.dart';
import 'package:virtam/styles/style.dart';
import 'package:virtam/user_data_screen/user_data_screen.dart';
import 'package:virtam/user_data_screen/user_data_view_model.dart';
import 'package:virtam/w.dart';
import 'package:virtam/welcome_screen/welcom_screen.dart';
import 'firebase_options.dart';
import 'forget_screen/forget_screen.dart';
import 'home_screen/home_screen.dart';
import 'home_screen/home_screen_view_model.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/login_screen_view_model.dart';
import 'option2_screen/option2_screen.dart';
import 'option2_screen/option2_view_model.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationHelper.initialize();
  AwesomeNotifications().setListeners(
    onActionReceivedMethod: NotificationController.onActionReceivedMethod,
    onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
    onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
    onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
  );



  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Option13ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataViewModel()),
    ChangeNotifierProvider(create: (_) => Option2UserModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ChangeNotifierProvider(create: (_) => DrinkCounter()),
  ],
      child:  MyApp())
  );
}
class MyApp extends StatelessWidget{
   MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return  MaterialApp.router(

      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeMode.system,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      debugShowCheckedModeBanner: false,
    );}
  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) =>  StepCounterScreen(),
        '/welcomeScreen': (context, state, data) => const WelcomeScreen(),
        '/loginScreen': (context, state, data) => const LoginScreen(),
        '/registerScreen': (context, state, data) => const RegisterScreen(),
        '/homeScreen': (context, state, data) => const HomeScreen(),
        '/option13': (context, state, data) => Option13Screen(),
        '/option2': (context, state, data) =>  const Option2Screen(),
        '/popUp': (context, state, data) =>  const PurposeScreen(),
      },
    ).call,
  );

}
