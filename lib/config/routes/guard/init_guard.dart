import 'package:auto_route/auto_route.dart';
import 'package:tic_tac_connect_app/core/common/providers/init_provider.dart';
import 'package:tic_tac_connect_app/core/services/dependency_injection/injection_container.dart';

class InitGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final provider = sl<InitProvider>();
    if(!provider.initialized){
      resolver.next();
    }
    resolver.next(false);
  }

}