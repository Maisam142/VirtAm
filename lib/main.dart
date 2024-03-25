import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/exercieses_screen/exercieses_screen.dart';
import 'package:virtam/home.dart';
import 'package:virtam/location_screen/location_screen_view_model.dart';
import 'package:virtam/notifications.dart';
import 'package:virtam/push_notification.dart';
import 'package:virtam/register_screen/purpose_screen.dart';
import 'package:virtam/register_screen/register_screen.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import 'package:virtam/setting_menu_screen/setting_menu_screen.dart';
import 'package:virtam/setting_menu_screen/setting_menu_view_model.dart';
import 'package:virtam/setting_menu_screen/subscription_screen.dart';
import 'package:virtam/splash_Screen/Splash_Screen.dart';
import 'package:virtam/step1-10_screens/user_data_step10_screen/user_data_step10_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step10_screen/user_data_step10_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step1_screen/user_data_step1_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step1_screen/user_data_step1_screen_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step2_screen/user_data_step2_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step2_screen/user_data_step2_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step3_screen/user_data_step3_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step3_screen/user_data_step3_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step4_screen/user_data_step4_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step4_screen/user_data_step4_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step5_screen/user_data_step5_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step5_screen/user_data_step5_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step6_screen/user_data_step6_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step6_screen/user_data_step6_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step7_screen/user_data_step7_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step7_screen/user_data_step7_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step8_screen/user_data_step8_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step8_screen/user_data_step8_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step9_screen/user_data_step9_screen.dart';
import 'package:virtam/step1-10_screens/user_data_step9_screen/user_data_step9_view_model.dart';
import 'package:virtam/styles/style.dart';
import 'package:virtam/weight_history_screen/weight_history_screen.dart';
import 'package:virtam/welcome_screen/welcom_screen.dart';
import 'setting_menu_screen/about_virtam_screen.dart';
import 'add_location_screen/add_location_screen.dart';
import 'add_location_screen/add_location_view_model.dart';
import 'calories_screen/calories_screen.dart';
import 'calories_screen/calories_setting_screen.dart';
import 'drink_water_screen/add_target_screen.dart';
import 'drink_water_screen/drink_water_screen.dart';
import 'drink_water_screen/drink_water_settings_screen.dart';
import 'drink_water_screen/drink_water_view_model.dart';
import 'fast_screen/break_fast_screen.dart';
import 'fast_screen/fast_screen.dart';
import 'firebase_options.dart';
import 'home_screen/home_screen.dart';
import 'home_screen/home_screen_view_model.dart';
import 'location_screen/location_screen.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/login_screen_view_model.dart';
import 'navigation_bar_screen/navigation_bar_screen.dart';
import 'navigation_bar_screen/navigation_bar_view_model.dart';
import 'notification_screen/notification_sceen.dart';
import 'nutrition_screen/nutrition_screen.dart';
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
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => RegisterViewModel()),
    ChangeNotifierProvider(create: (_) => Option2UserModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ChangeNotifierProvider(create: (_) => DrinkCounter()),
    ChangeNotifierProvider(create: (_) => UserDataStep1ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep2ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep3ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep4ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep5ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep6ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep7ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep8ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep9ViewModel()),
    ChangeNotifierProvider(create: (_) => UserDataStep10ViewModel()),
    ChangeNotifierProvider(create: (_) => CurrentLocationViewModel()),
    ChangeNotifierProvider(create: (_) => AddLocationViewModel()),
    ChangeNotifierProvider(create: (_) => NavigationBarViewModel()),
    ChangeNotifierProvider(create: (_) => DrinkWaterViewModel()),
    ChangeNotifierProvider(create: (_) => SettingMenuViewModel()),
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
        '/': (context, state, data) =>  const HomeNavigationBar(),
        '/welcomeScreen': (context, state, data) => const WelcomeScreen(),
        '/loginScreen': (context, state, data) => const LoginScreen(),
        '/registerScreen': (context, state, data) => const RegisterScreen(),
        '/homeNavigationBar': (context, state, data) => const HomeNavigationBar(),
        '/option2Screen': (context, state, data) => const Option2Screen(),
        '/purposeScreen': (context, state, data) =>  const PurposeScreen(),
        '/userDataStep1': (context, state, data) => const UserDataScreenStep1(),
        '/userDataStep2': (context, state, data) =>  const UserDataScreenStep2(),
        '/userDataStep3': (context, state, data) =>  const UserDataScreenStep3(),
        '/userDataStep4': (context, state, data) =>  const UserDataScreenStep4(),
        '/userDataStep5': (context, state, data) =>  const UserDataScreenStep5(),
        '/userDataStep6': (context, state, data) =>  const UserDataScreenStep6(),
        '/userDataStep7': (context, state, data) =>  const UserDataScreenStep7(),
        '/userDataStep8': (context, state, data) =>  const UserDataScreenStep8(),
        '/userDataStep9': (context, state, data) =>  const UserDataScreenStep9(),
        '/userDataStep10': (context, state, data) =>  const UserDataScreenStep10(),
        '/drinkWaterScreen': (context, state, data) =>  const DrinkWaterScreen(),
        '/addTargetScreen': (context, state, data) =>  const AddTargetScreen(),
        '/weightHistoryScreen': (context, state, data) =>  const WeightHistoryScreen(),
        '/nutritionScreen': (context, state, data) =>  const NutritionScreen(),
        '/exercisesScreen': (context, state, data) =>  const ExercisesScreen(),
        '/fastScreen': (context, state, data) =>  const FastScreen(),
        '/breakFastScreen': (context, state, data) =>  const BreakFastScreen(),
        '/settingMenuScreen': (context, state, data) =>  const SettingMenuScreen(),
        '/drinkSettingScreen': (context, state, data) =>  const DrinkSettingScreen(),
        '/aboutVirtAmScreen': (context, state, data) =>  const AboutVirtAmScreen(),
        '/caloriesSettingScreen': (context, state, data) =>  const CaloriesSettingScreen(),
        '/caloriesScreen': (context, state, data) =>  const CaloriesScreen(),
        '/notificationScreen': (context, state, data) =>  const NotificationScreen(),
        '/subscriptionScreen': (context, state, data) =>  const SubscriptionScreen(),
      },
    ).call,
  );

}
