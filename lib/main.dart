import 'package:bpc_test/bloc/main/MainBloc.dart';
import 'package:bpc_test/screens/main/AuthTypeSlector.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthExampleApp());
}

class AuthExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(),
          ),
        ],
          child: MaterialApp(
            title: 'Firebase Example App',
            theme: ThemeData.dark(),
            home: Scaffold(
              body: AuthTypeSelector(),
            ),
          ),
      ),
    );
  }
}


