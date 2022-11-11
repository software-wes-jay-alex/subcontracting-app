
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:materialist/models/myuser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:materialist/screens/wrapper.dart';
import 'bloc/bloc_exports.dart';
import 'screens/tabs_screen.dart';
import 'services/app_router.dart';
import 'services/app_theme.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:materialist/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: MyUser(uid: null),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

//Future main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
//
//  final db = FirebaseFirestore.instance;
//
//  final storage = await HydratedStorage.build(
//    storageDirectory: kIsWeb
//      ? HydratedStorage.webStorageDirectory
//      : await getApplicationDocumentsDirectory(),
//  );
//  HydratedBlocOverrides.runZoned(
//    () => runApp(MyApp(
//      appRouter: AppRouter(),
//    )),
//    storage: storage,
//  );
//}
//
//class MyApp extends StatelessWidget {
//  const MyApp({Key? key, required this.appRouter}) : super(key: key);
//  final AppRouter appRouter;
//
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MultiBlocProvider(
//      providers: [
//        BlocProvider(
//          create: (context) => MaterialsBloc(),
//        ),
//        BlocProvider(
//          create: (context) => SwitchBloc(),
//        ),
//      ],
//      child: BlocBuilder<SwitchBloc, SwitchState>(
//        builder: (context, state) {
//          return MaterialApp(
//            title: 'MateriaList',
//            theme: state.switchValue
//                ? AppThemes.appThemeData[AppTheme.darkTheme]
//                : AppThemes.appThemeData[AppTheme.lightTheme],
//            home: Wrapper(),
//            onGenerateRoute: appRouter.onGenerateRoute,
//          );
//        },
//      ),
//    );
//  }
//}
