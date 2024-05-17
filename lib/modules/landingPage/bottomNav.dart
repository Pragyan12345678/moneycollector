import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneycollection/constant/CustomShowDialog.dart';
import 'package:moneycollection/constant/colors.dart';
import 'package:moneycollection/constant/image.dart';
import 'package:moneycollection/modules/dashboard/dashboard.dart';
import 'package:moneycollection/modules/profile/profile.dart';
import 'package:moneycollection/provider/controller/home_state.dart';
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
        const DashboardHome(),
        const DashboardHome(),
        const Profileview(),
        // Constant.loginToken == "" ? const LoginPage() : const ProfilePage(),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(
      builder: (context, homeState, child) {
        return Consumer<ThemeModel>(
          builder: (context, theme, child) {
            
                return PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    customShowDialog(
                      context: context,
                      title: "Exit Sanatan Sewa",
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
                          icon: Image.asset(
                            homeState.selectedScreen == 0
                                ? AppImages.home
                                : AppImages.home,
                            height: 22,
                            fit: BoxFit.contain,
                            color: Colors.black
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            homeState.selectedScreen == 1
                               ? AppImages.deposit
                                : AppImages.deposit,
                            height: 24,
                            fit: BoxFit.contain,
                            color: theme.currentTheme == lightTheme
                                ? AppColors.primaryBrown
                                : AppColors.primaryGolden,
                          ),
                          label: 'Consult',
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            homeState.selectedScreen == 2
                              ? AppImages.transaction
                                : AppImages.transaction,
                            height: 24,
                            fit: BoxFit.contain,
                            color: theme.currentTheme == lightTheme
                                ? AppColors.primaryBrown
                                : AppColors.primaryGolden,
                          ),
                          label: 'Products',
                          
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            homeState.selectedScreen == 3
                               ? AppImages.user
                                : AppImages.user,
                            height: 24,
                            fit: BoxFit.contain,
                            color: theme.currentTheme == lightTheme
                                ? AppColors.primaryBlack
                                : AppColors.primaryGolden,
                          ),
                          label: 
                              'Profile',
                        ),
                      ],
                      currentIndex: homeState.selectedScreen,
                      onTap: (index) {
                        if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profileview(),
                            ),
                          );
                        } else {
                          homeState.onScreenTapped(
                            index,
                          );
                        }
                      },
                    ),
                  ),
                );
             
          },
        );
      },
    );
  }
}
