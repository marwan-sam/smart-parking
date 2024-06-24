import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_parking/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking/feature/auth/login/login_screen.dart';
import 'package:smart_parking/feature/extend%20timer/ui/extend_timer_view.dart';
import 'package:smart_parking/feature/home/parking_details_screen.dart';
import 'package:smart_parking/feature/home/tabs_home.dart';
import 'package:smart_parking/feature/pay/cancel/cancel_view.dart';
import 'package:smart_parking/feature/pay/pay_extend_time_view.dart';
import 'package:smart_parking/feature/pay/pay_view.dart';
import 'package:smart_parking/feature/review%20summary/review_summary.dart';
import 'package:smart_parking/feature/setting/change_password/logic/change_password_cubit.dart';
import 'package:smart_parking/feature/setting/change_password/ui/change_password_ui.dart';
import 'package:smart_parking/feature/setting/settings_ui.dart';
import 'package:smart_parking/feature/ticket/ticket_view.dart';
import 'name_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.pathSplash:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashScreen(),
      //   );

      case Routes.pathLogin:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.pathHome:
        return MaterialPageRoute(
          builder: (context) => const TabsHome(),
        );
      case Routes.pathGetParking:
        return MaterialPageRoute(
          builder: (context) => const ParkingDetailsScreen(),
        );
      case Routes.pathPay:
        return MaterialPageRoute(
          builder: (context) => const PayUI(),
        );
      // case NameRoutes.pathCredit:
      //   return MaterialPageRoute(
      //     builder: (context) => const PaymentUI(), //const MyCartView(),
      //   );
      case Routes.pathTicket:
        return MaterialPageRoute(
          builder: (context) => const TicketUI(),
        );
      case Routes.pathReviewPayment:
        return MaterialPageRoute(
          builder: (context) => const ReviewSummaryUI(),
        );
      case Routes.pathExtendTime:
        return MaterialPageRoute(
          builder: (context) => const ExtendTimeView(),
        );
      case Routes.pathExtendPay:
        return MaterialPageRoute(
          builder: (context) => const PayExtendTimeUI(),
        );
      case Routes.pathCancel:
        return MaterialPageRoute(
          builder: (context) => const CancelUI(),
        );

      case Routes.pathSetting:
        return MaterialPageRoute(
          builder: (context) => const SettingsUI(),
        );

      case Routes.pathChangePassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: const ChangePasswordUI(),
          ),
        );

      // case NameRoutes.pathNotification:
      //   return MaterialPageRoute(
      //     builder: (context) => const NotificationUI(),
      //   );

      // case NameRoutes.pathSecurity:
      //   return MaterialPageRoute(
      //     builder: (context) => const SecurityUI(),
      //   );
      //SECTION Default Case
      default:
        return null;
      // return MaterialPageRoute(
      //   builder: (_) => Scaffold(
      //     body: Center(
      //       child: Text("NO ROUTE DEFINE FOR ${settings.name}"),
      //     ),
      //   ),
      // );
    }
  }
}
