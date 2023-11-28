import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/shrine/current_location_notifier.dart';
import 'package:zinjanow_app/ui/notify/shrine/shrine_notifier.dart';
import 'package:zinjanow_app/ui/notify/user/user_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/logout_button.dart';
import 'package:zinjanow_app/ui/view/components/category_title.dart';
import 'package:zinjanow_app/ui/view/components/common/header.dart';
import 'package:zinjanow_app/ui/view/components/main/current_shrines.dart';

@RoutePage()
class HomeAutoRouterPage extends AutoRouter {
  const HomeAutoRouterPage({super.key});
}

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {

  Future<void> _onRefreshShrineState() async {
    await ref.read(currentLocationProvider.notifier).fetch();
    await ref.read(shrineNotifierProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userNotifierProvider.notifier).fetch();
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
