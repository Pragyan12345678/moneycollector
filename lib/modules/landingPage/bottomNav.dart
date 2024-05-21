import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneycollection/constant/CustomShowDialog.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/Statement/statement.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';
import 'package:moneycollection/modules/profile/profile.dart';
import 'package:moneycollection/provider/controller/home_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:provider/provider.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Widget>? _screen;

  @override
  void initState() {
    super.initState();
    _updateScreen();
  }

  void _updateScreen() {
    setState(() {
      _screen = <Widget>[
        const DashboardHome(),
        const Statement(),
        const Profileview(),
        // Constant.loginToken == "" ? const LoginPage() : const ProfilePage(),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
  builder: (context, homeState, child) {
    return Consumer<AuthState>(
      builder: (context, authController, child) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            customShowDialog(
              context: context,
              title: "Exit Tech Finance",
              content: "Are you sure you want to exit the application?",
              onYesPressed: () {
                Navigator.pop(context);
                SystemChannels.platform
                    .invokeMethod('SystemNavigator.pop');
              },
              onNoPressed: () {
                Navigator.pop(context);
              },
            );
          },
          child: Scaffold(
            body: Center(
              child: _screen!.elementAt(homeState.selectedScreen),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon:  Image.asset(
                            homeState.selectedScreen == 0
                                ? AppImages.home
                                : AppImages.home,
                            height: 22,
                            fit: BoxFit.contain,
                            color: Colors.black,
                            
                          ),

                  label: 'Home',
                ),
                // BottomNavigationBarItem(
                //   icon:  Image.asset(
                //             homeState.selectedScreen == 1
                //                ? AppImages.moneycollection
                //                 : AppImages.moneycollection,
                //             height: 24,
                //             fit: BoxFit.contain,
                //             color: theme.currentTheme == lightTheme
                //                 ? AppColors.primaryBrown
                //                 : AppColors.primaryGolden,
                //           ),

                //   label: 'Collection',
                // ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                            homeState.selectedScreen == 1
                               ? AppImages.statement
                                : AppImages.statement,
                            height: 24,
                            fit: BoxFit.contain,
                            color: theme.currentTheme == lightTheme
                                ? AppColors.primaryBrown
                                : AppColors.primaryGolden,
                          ),
                  label: 'Statement',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                            homeState.selectedScreen == 2
                               ? AppImages.user
                                : AppImages.user,
                            height: 24,
                            fit: BoxFit.contain,
                            color: theme.currentTheme == lightTheme
                                ? AppColors.primaryBrown
                                : AppColors.primaryGolden,
                          ),
                  label: 'Profile',
                ),
              ],
              currentIndex: homeState.selectedScreen,
              onTap: (index) {
                if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profileview(),
                    ),
                  );
                } else {
                  homeState.onScreenTapped(index);
                }
              },
              selectedItemColor: AppColors.primaryBlue, // Change the selected item color
              unselectedItemColor: Colors.grey, // Change the unselected item color
              showSelectedLabels: true, // Optionally, hide or show the labels
              showUnselectedLabels: true, // Optionally, hide or show the labels
            ),
          ),
        );
      },
    );
      });
  },
);
  }
}
