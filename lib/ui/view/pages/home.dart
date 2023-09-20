import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/logout_notifier.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/category_title.dart';
import 'package:zinjanow_app/ui/view/components/common/header.dart';
import 'package:zinjanow_app/ui/view/components/home/current_shrines.dart';
import 'package:zinjanow_app/ui/view/pages/welcome.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  String isLoading = "idel";

  void _setIsLoading(String value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<void> _onRefreshShrineState() async {
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
    ref.watch(shrineNotifierProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(CustomColor.mainBackground),
      body: Stack(
        // alignment: AlignmentDirectional.center,
        children: [
          const Header(),
          Container(
            margin: EdgeInsets.only(top: 150),
            width: size.width,
            height: size.height * 100,
            decoration: BoxDecoration(
              color: const Color(CustomColor.mainBackground),
              borderRadius: BorderRadius.circular(16)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RefreshIndicator(
              onRefresh: _onRefreshShrineState,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CategoryTitle(titleText: "Shrines"),
                    const CurrentShrine(),
                    RoundedButton(
                      title: "Logout", 
                      backGroundColor: CustomColor.buttonBlack, 
                      textColor: CustomColor.buttonWhite, 
                      marginTop: 30,
                      marginBottom: 30, 
                      isActive: true, 
                      isLoading: isLoading,
                      onPressedCallBack: _logout,
                    )
                  ],
                ),
              ),
            )
          )
        ],
      )
    );
  }
}
