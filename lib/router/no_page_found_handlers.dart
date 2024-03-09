import 'package:admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundhandlers {
  static Handler page404 = Handler(
    handlerFunc: (context, parameters) {
      return const NoPageFound();
    },
  );
}
