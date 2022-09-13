// ignore_for_file: file_names, avoid_unnecessary_containers
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/view/screen/home_screen/domin/bottom_navigation_logic.dart';
import 'package:expo_visitor/view/screen/home_screen/presintation/home_screen.dart';
import 'package:expo_visitor/view/screen/home_screen/presintation/test.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/widget/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme.dart';

class MainRootScreen extends StatefulWidget {
  final bool isactive;
  const MainRootScreen({Key? key, required this.isactive}) : super(key: key);

  @override
  State<MainRootScreen> createState() => _MainRootScreenState();
}

class _MainRootScreenState extends State<MainRootScreen> {
  var currentTab = [
    const HomeScreen(),
    const Test(),
    const Test(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: AppColors.scaffoldbackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu_sharp,
            color: AppColors.black,
          ),
        ),
      ),
      drawer: const CustomDrawer(onItemTapped: onItemTapped, type: 1),
      bottomNavigationBar: Container(
          color: Colors.transparent,
          child: SizedBox(
            height: 70,
            child: Material(
              elevation: 0.0,
              child: BottomNavigationBar(
                currentIndex: provider.currentIndex,
                onTap: (index) {
                  provider.currentIndex = index;
                },
                showSelectedLabels: true,
                selectedFontSize: 7.sp,
                showUnselectedLabels: false,
                selectedItemColor: widget.isactive
                    ? Theme.of(context).primaryColor
                    : AppColors.openblue,
                unselectedItemColor: AppColors.openblue,
                backgroundColor: AppColors.blue,
                iconSize: 15,
                unselectedFontSize: 0.0,
                elevation: 5,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 25,
                      ),
                      activeIcon: widget.isactive
                          ? Container(
                              // padding: EdgeInsets.only(bottom: 1.h),

                              child: Icon(
                                Icons.home,
                                size: 25,
                              ),
                            )
                          : Icon(
                              Icons.home,
                              size: 25,
                            ),
                      label: "homepage".tr(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                      activeIcon: widget.isactive
                          ? Container(
                              child: Icon(
                                Icons.search,
                                size: 25,
                              ),
                            )
                          : Icon(
                              Icons.search,
                              size: 25,
                            ),
                      label: "myappointments".tr(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.back_hand,
                        size: 25,
                      ),
                      activeIcon: widget.isactive
                          ? Container(
                              child: Icon(
                                Icons.back_hand,
                                size: 25,
                              ),
                            )
                          : Icon(
                              Icons.back_hand,
                              size: 25,
                            ),
                      label: "summary".tr(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.qr_code_scanner_outlined,
                        size: 25,
                      ),
                      activeIcon: widget.isactive
                          ? Container(
                              child: Icon(
                                Icons.qr_code_scanner_outlined,
                                size: 25,
                              ),
                            )
                          : Icon(
                              Icons.qr_code_scanner_outlined,
                              size: 25,
                            ),
                      label: "scanqr".tr(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.qr_code_2_outlined,
                        size: 25,
                      ),
                      activeIcon: widget.isactive
                          ? Container(
                              child: Icon(
                                Icons.qr_code_2_outlined,
                                size: 25,
                              ),
                            )
                          : Icon(
                              Icons.qr_code_2_outlined,
                              size: 25,
                            ),
                      label: "viewqr".tr(),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                ],
              ),
            ),
          )),
      body: currentTab[provider.currentIndex],
    );
  }
}

void onItemTapped(int index) {}
