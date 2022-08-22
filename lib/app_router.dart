import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static Future<String?> NavigateToWidget(Widget widget) async {
    String? x = await Navigator.of(navKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
    return x;
  }

  static NavigateWithReplacemtnToWidget(Widget widget) {
    Navigator.of(navKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static PopRouter() {
    Navigator.of(navKey.currentContext!).pop();
  }
}























// class AppRouter {
//   static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
//   NavigateToWidget(Widget widget) async {
//     String? x = await Navigator.of(navKey.currentContext!)
//         .push(MaterialPageRoute(builder: (context) {
//       return widget;
//     }));
//     return x;
//   }

//   static Future<String?> NavigateWithReplacemtnToWidget(Widget widget) async {
//     String? x = await Navigator.of(navKey.currentContext!)
//         .pushReplacement(MaterialPageRoute(builder: (context) {
//       return widget;
//     }));
//     return x;
//   }
// }
// import 'package:awesome_clother_shop/views/home.dart';
// import 'package:awesome_clother_shop/views/login.dart';
// import 'package:awesome_clother_shop/views/sign_up.dart';
// import 'package:awesome_clother_shop/views/splash.dart';
// import 'package:flutter/material.dart';

// class AppRoute {
//   static const String splash = '/';
//   static const String loginpage = '/signuppage';
//   static const String signuppage = '/home';
//   static const String homepage = '/onboarding';


//   Route? generatedRoute(RouteSettings settings) {
//     switch (settings.name) {
//        case splash:
//         return MaterialPageRoute(builder: (_) => SplashSCreen());
//       case loginpage:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//       case signuppage:
//         return MaterialPageRoute(builder: (_) =>  SignupScreen());
//       case homepage:
//         return MaterialPageRoute(builder: (_) =>  MyHomePage(title: 'sojod',));
      
//     }
//   }
// }
