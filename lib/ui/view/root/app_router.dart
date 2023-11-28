import 'package:auto_route/auto_route.dart';
import 'package:zinjanow_app/ui/view/pages/auth/complete_password_reset_link_page.dart';
import 'package:zinjanow_app/ui/view/pages/auth/forget_password_page.dart';
import 'package:zinjanow_app/ui/view/pages/auth/login_page.dart';
import 'package:zinjanow_app/ui/view/pages/auth/register_page.dart';
import 'package:zinjanow_app/ui/view/pages/home_page.dart';
import 'package:zinjanow_app/ui/view/pages/my_page.dart';
import 'package:zinjanow_app/ui/view/pages/mypage/edit_profile_page.dart';
import 'package:zinjanow_app/ui/view/pages/mypage/follow_page.dart';
import 'package:zinjanow_app/ui/view/pages/mypage/help_page.dart';
import 'package:zinjanow_app/ui/view/pages/mypage/qr_code_page.dart';
import 'package:zinjanow_app/ui/view/pages/mypage/settings_page.dart';
import 'package:zinjanow_app/ui/view/pages/profile_page.dart';
import 'package:zinjanow_app/ui/view/pages/router_page.dart';
import 'package:zinjanow_app/ui/view/pages/shrine_detail_page.dart';
import 'package:zinjanow_app/ui/view/pages/splash_page.dart';
import 'package:zinjanow_app/ui/view/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    // auth
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: ForgetPassWordRoute.page),

    // authenticated
    AutoRoute(
      page: RouterRoute.page,
      children: [
        AutoRoute(
          page: HomeAutoRouterRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true
            ),
            AutoRoute(
              page: ShrineDetailRoute.page
            ),
            AutoRoute(
              page: ProfileRoute.page
            )
          ]
        ),
        AutoRoute(
          page: MyAutoRouterRoute.page,
          children: [
            AutoRoute(
              page: MyRoute.page,
              initial: true
            ),
            AutoRoute(
              page: EditProfileRoute.page
            ),
            AutoRoute(
              page: FollowRoute.page
            ),
            AutoRoute(
              page: QrCodeRoute.page
            ),
            AutoRoute(
              page: SettingsRoute.page
            ),
            AutoRoute(
              page: HelpRoute.page
            )
          ]
        ),
      ]
    )
  ];
}