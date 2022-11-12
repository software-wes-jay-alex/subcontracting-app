import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'bloc/bloc_exports.dart';
import 'screens/tabs_screen.dart';
import 'services/app_router.dart';
import 'services/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';//added for firebase core
import 'firebase_options.dart';//added for firebase

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );// added for firebase support

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
    storage: storage,
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialsBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Materialist',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
