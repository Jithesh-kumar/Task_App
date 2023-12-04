import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/tabs_screen.dart';
import 'package:flutter_task_app/services/app_router.dart';
//import 'package:flutter_task_app/services/app_theme.dart';
//import 'package:flutter_task_app/models/task.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_exports.dart';
//import 'screens/pending_screen.dart';
import 'services/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(
    MyApp(
      appRoute: AppRoute(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoute}) : super(key: key);
  final AppRoute appRoute;
  // This widget is the root
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: TabsScreen(),
            onGenerateRoute: appRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}
