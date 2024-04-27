import 'package:flood/flood.dart';
import 'package:{{project_name.snakeCase()}}/presentation/pages/home_page.dart';

class PagesAppPondComponent with IsAppPondComponent {
  @override
  Map<Route, AppPage> get pages => {
        HomeRoute(): HomePage(),
        // TODO As you create AppPages, add them here.
      };
}
