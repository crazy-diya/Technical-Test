import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technical_test/features/domain/entities/product_details_entity.dart';
import 'package:technical_test/features/presentation/views/cart/cart_view.dart';
import 'package:technical_test/features/presentation/views/home/home_view.dart';
import 'package:technical_test/features/presentation/views/product_details/product_details_view.dart';

import '../features/presentation/views/splash/splash_view.dart';

class Routes {
  static const String kSplashView = "kSplashView";
  static const String kHomeView = "kHomeView";
  static const String kProductDetails = "kProductDetails";
  static const String kCartView = "kProdukCartViewctDetails";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kSplashView:
        return PageTransition(
          child: SplashView(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kSplashView),
        );
      case Routes.kHomeView:
        return PageTransition(
          child: const HomeView(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kHomeView),
        );
      case Routes.kProductDetails:
        return PageTransition(
          child: ProductDetailsView(
            datum: settings.arguments as Datum,
          ),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kHomeView),
        );
      case Routes.kCartView:
        return PageTransition(
          child: const CartView(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kCartView),
        );
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
