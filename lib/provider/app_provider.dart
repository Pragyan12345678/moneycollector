
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
    // ChangeNotifierProvider(
    //   lazy: false,
    //   create: (context) => FirstState(),
    // ),
    
  ];
}
