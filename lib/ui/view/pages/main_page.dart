import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/logout_notifier.dart';
import 'package:zinjanow_app/ui/notify/shrine/current_location_notifier.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/logout_button.dart';
import 'package:zinjanow_app/ui/view/components/category_title.dart';
import 'package:zinjanow_app/ui/view/components/common/header.dart';
import 'package:zinjanow_app/ui/view/components/main/current_shrines.dart';
import 'package:zinjanow_app/ui/view/pages/welcome.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  String isLoading = "idel";

  void _setIsLoading(String value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<void> _onRefreshShrineState() async {
    await ref.read(currentLocationProvider.notifier).fetch();
    await ref.read(shrineNotifierProvider.notifier).fetch();
  }

  void _logout() async {
    _setIsLoading("loading");

    await ref.read(logoutNotifierProvider.notifier).logout();
    final logoutProvider = ref.watch(logoutNotifierProvider);

    logoutProvider.when(
      data: (authState) {
      if(authState.isAuth == false) {
        _setIsLoading("success");
        ref.read(shrineNotifierProvider.notifier).dispose();
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => const Welcome()), 
          (route) => false
        );
      } else {
        _setIsLoading("idel");
      }
      },
      error: (error,_) {
        //
      },
      loading: () {
        _setIsLoading("loading");
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Header(
            backgroundImage: "images/20180716101741.jpg",
            color: CustomColor.mainTheme,
            height: 160,
            visibleText: true,
            visibleIcon: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 140),
            width: size.width,
            height: size.height * 100,
            decoration: BoxDecoration(
              color: const Color(CustomColor.mainBackground),
              borderRadius: BorderRadius.circular(20)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RefreshIndicator(
              onRefresh: _onRefreshShrineState,
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryTitle(titleText: "SHRINES"),
                    CurrentShrine(),
                    LogoutButton()
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
