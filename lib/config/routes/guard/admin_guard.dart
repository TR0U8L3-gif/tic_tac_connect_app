import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

class AdminGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if(kDebugMode){
      resolver.next();
    } else {
      resolver.next(false);
    }
  }
}
