
import 'package:moneycollection/provider/controller/Office_state.dart';
import 'package:moneycollection/provider/controller/RecentTransaction_state.dart';
import 'package:moneycollection/provider/controller/dashboard_state.dart';
import 'package:moneycollection/provider/controller/home_state.dart';
import 'package:moneycollection/provider/controller/login_state.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => AuthState(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => HomeState(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => DashboardState(),
    ),
     ChangeNotifierProvider(
      lazy: false,
      create: (context) => DropdownProvider(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => TransactionProvider(),
    ),
  ];
}
