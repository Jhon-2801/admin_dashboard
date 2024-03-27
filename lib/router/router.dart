import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRouter = '/auth/login';
  static String registerRouter = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categories';
  static String usersRoute = '/dashboard/user';

  static void configureRouter() {
    // Auth Router
    router.define(rootRoute,
        handler: Adminhandlers.login, transitionType: TransitionType.none);
    router.define(loginRouter,
        handler: Adminhandlers.login, transitionType: TransitionType.none);
    router.define(registerRouter,
        handler: Adminhandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute,
        handler: Dashboardhandlers.dashborad,
        transitionType: TransitionType.none);
    router.define(iconsRoute,
        handler: Dashboardhandlers.icons, transitionType: TransitionType.none);
    router.define(blankRoute,
        handler: Dashboardhandlers.blank, transitionType: TransitionType.none);
    router.define(categoriesRoute,
        handler: Dashboardhandlers.categories,
        transitionType: TransitionType.none);
    router.define(usersRoute,
        handler: Dashboardhandlers.users, transitionType: TransitionType.none);

    //404
    router.notFoundHandler = NoPageFoundhandlers.page404;
  }
}
