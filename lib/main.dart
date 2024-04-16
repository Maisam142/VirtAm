import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:virtam/styles/style.dart';
import 'package:virtam/user/feature/add_location_screen/add_location_view_model.dart';
import 'package:virtam/user/feature/calories_screen/calories_screen.dart';
import 'package:virtam/user/feature/calories_screen/calories_setting_screen.dart';
import 'package:virtam/user/feature/drink_water_screen/add_target_screen.dart';
import 'package:virtam/user/feature/drink_water_screen/drink_water_screen.dart';
import 'package:virtam/user/feature/drink_water_screen/drink_water_settings_screen.dart';
import 'package:virtam/user/feature/drink_water_screen/drink_water_view_model.dart';
import 'package:virtam/user/feature/exercieses_screen/exercieses_screen.dart';
import 'package:virtam/user/feature/fast_screen/break_fast_screen.dart';
import 'package:virtam/user/feature/fast_screen/fast_screen.dart';
import 'package:virtam/user/feature/home_screen/home_screen.dart';
import 'package:virtam/user/feature/home_screen/home_screen_view_model.dart';
import 'package:virtam/user/feature/location_screen/location_screen_view_model.dart';
import 'package:virtam/user/feature/login_screen/login_screen.dart';
import 'package:virtam/user/feature/login_screen/login_screen_view_model.dart';
import 'package:virtam/user/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'package:virtam/user/feature/navigation_bar_screen/navigation_bar_view_model.dart';
import 'package:virtam/user/feature/notification_screen/notification_sceen.dart';
import 'package:virtam/user/feature/nutrition_screen/nutrition_screen.dart';
import 'package:virtam/user/feature/option2_screen/option2_screen.dart';
import 'package:virtam/user/feature/option2_screen/option2_view_model.dart';
import 'package:virtam/user/feature/profile_screen/profile_screen.dart';
import 'package:virtam/user/feature/profile_screen/profile_view_model.dart';
import 'package:virtam/user/feature/register_screen/purpose_screen.dart';
import 'package:virtam/user/feature/register_screen/register_screen.dart';
import 'package:virtam/user/feature/register_screen/register_screen_view_model.dart';
import 'package:virtam/user/feature/setting_menu_screen/about_virtam_screen.dart';
import 'package:virtam/user/feature/setting_menu_screen/setting_menu_screen.dart';
import 'package:virtam/user/feature/setting_menu_screen/setting_menu_view_model.dart';
import 'package:virtam/user/feature/setting_menu_screen/subscription_screen.dart';
import 'package:virtam/user/feature/splash_Screen/Splash_Screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step10_screen/user_data_step10_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step10_screen/user_data_step10_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step1_screen/user_data_step1_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step1_screen/user_data_step1_screen_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step2_screen/user_data_step2_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step2_screen/user_data_step2_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step3_screen/user_data_step3_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step3_screen/user_data_step3_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step4_screen/user_data_step4_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step4_screen/user_data_step4_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step5_screen/user_data_step5_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step5_screen/user_data_step5_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step6_screen/user_data_step6_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step6_screen/user_data_step6_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step7_screen/user_data_step7_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step7_screen/user_data_step7_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step8_screen/user_data_step8_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step8_screen/user_data_step8_view_model.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step9_screen/user_data_step9_screen.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step9_screen/user_data_step9_view_model.dart';
import 'package:virtam/user/feature/weight_history_screen/weight_history_screen.dart';
import 'package:virtam/user/feature/welcome_screen/welcom_screen.dart';

import 'admin_feature/admin/add_daily_meals_screen/add_daily_meals_screen.dart';
import 'admin_feature/admin/add_exercise_screen/add_exercise_screen.dart';
import 'admin_feature/admin/admin_members_screen/admin_members_details_screen.dart';
import 'admin_feature/admin/admin_members_screen/admin_members_screen.dart';
import 'admin_feature/admin/home_admin_screen/home_admin_screen.dart';
import 'admin_feature/admin/members_screen/members_details_screen.dart';
import 'admin_feature/admin/members_screen/members_screen.dart';
import 'admin_feature/admin/send_notification_screen/send_notification_screen.dart';
import 'admin_feature/master_admin/admin_members_tomasterAdmin_screen/add_admin_screen.dart';
import 'admin_feature/master_admin/admin_members_tomasterAdmin_screen/admin_members_tomasterAdmin.dart';
import 'admin_feature/master_admin/admin_members_tomasterAdmin_screen/admin_members_tomasterAdmin_details.dart';
import 'admin_feature/master_admin/home_masterAdmin_screen/home_masterAdmin_screen.dart';

import 'admin_feature/master_admin/masterAdmin_profile_screen/masterAdmin_profile_screen.dart';
import 'admin_feature/master_admin/masterAdmin_profile_screen/subscription_toAdmin_screen.dart';
import 'admin_feature/master_admin/members_toadmins_screen/members_toadmin_details_screen.dart';
import 'admin_feature/master_admin/members_toadmins_screen/members_toadmin_screen.dart';
import 'admin_feature/virtam_admin/virtam_admin_screen.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'main_view_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => RegisterViewModel()),
    ChangeNotifierProvider(create: (_) => Option2UserModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
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
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    //ChangeNotifierProvider(create: (_) => NotificationViewModel()),
  ],
      child:  MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> implements AddLanguageDefaultListeners {
  _MyApp();

  late final MainViewModel? vmProvider;
  // StreamSubscription? _streamSubscription;

  @override
  void initState() {
    vmProvider = Provider.of<MainViewModel>(context, listen: false);
    vmProvider?.init(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    final vm = Provider.of<MainViewModel>(context);

    return  MaterialApp.router(

      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeMode.system,
      routerDelegate: routerDelegate,
      locale: vm.appLocal,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      routeInformationParser: BeamerParser(),
      debugShowCheckedModeBanner: false,
    );}

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) =>  const SplashScreen(),
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
        '/profileScreen': (context, state, data) =>  const ProfileScreen(),
        '/homeScreen': (context, state, data) =>  const HomeScreen(),
        '/nutritionScreen': (context, state, data) =>  const NutritionScreen(),
        //--------------------------------------------------------------------------------------------------------
        '/homeAdminScreen': (context, state, data) =>  const HomeAdminScreen(),
        '/addDailyMealsScreen': (context, state, data) =>  const AddDailyMealsScreen(),
        '/membersScreen': (context, state, data) =>  const MembersScreen(),
        '/adminUserDetailsScreen': (context, state, data) =>  AdminUserDetailsScreen(memberData: {},),
        '/adminMembersScreen': (context, state, data) =>  const AdminMembersScreen(),
        '/sendNotificationScreen': (context, state, data) =>  const SendNotificationScreen(),
        '/addExerciseScreen': (context, state, data) =>  const AddExerciseScreen(),
        '/userDetailsScreen': (context, state, data) =>   UserDetailsScreen(memberData: {},),
        '/homeMasterAdminScreen': (context, state, data) =>  const HomeMasterAdminScreen(),
        '/userDetailsToAdminScreen': (context, state, data) =>  UserDetailsToAdminScreen(memberData: {},),
        '/membersToAdminsScreen': (context, state, data) =>  const MembersToAdminsScreen(),
        '/adminMembersToMasterScreen': (context, state, data) =>  const AdminMembersToMasterScreen(),
        '/adminUserToMasterDetailsScreen': (context, state, data) =>  AdminUserToMasterDetailsScreen(memberData: {}),
        '/addAdminScreen': (context, state, data) =>  const AddAdminScreen(),
        '/masterAdminProfileScreen': (context, state, data) =>  const MasterAdminProfileScreen(),
        '/subscriptionToAdminScreen': (context, state, data) =>  const SubscriptionToAdminScreen(),
      },
    ).call,
  );

}
