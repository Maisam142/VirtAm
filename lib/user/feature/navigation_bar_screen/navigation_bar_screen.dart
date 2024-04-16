import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../calories_screen/calories_screen.dart';

import '../home_screen/home_screen.dart';
import '../notification_screen/notification_sceen.dart';
import '../nutrition_screen/nutrition_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'navigation_bar_view_model.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  @override
void initState() {
    super.initState();
    NotificationHelper.initialize();
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );


  }

  @override
  Widget build(BuildContext context) {
    var navigate = Provider.of<NavigationBarViewModel>(context);



    return Scaffold(
      body: Consumer<NavigationBarViewModel>(
        builder: (context, provider, _) {
          return IndexedStack(
            index: provider.selectedIndex,
            children:  [
              HomeScreen(),
              CaloriesScreen(),
              NutritionScreen(),
              ProfileScreen()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
                size: 30,
          ),
          type: BottomNavigationBarType.fixed,
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/home.png')),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/calories.png')),
                label: ''
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/apple.png')),
                label: ''

            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/person.png')),
                label: ''

            ),
          ],
          currentIndex: navigate.selectedIndex,
          onTap: (index)
          {
            navigate.navigate(index);
          }
      ),
    );
  }
}
