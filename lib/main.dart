import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<void> _initializeFirebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            future: _initializeFirebase,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Something went wrong ====================> ${snapshot.error}');
                return Center(child: Text('Something went wrong'));
              } else if (snapshot.connectionState == ConnectionState.done) {
                print(' =========> Loaded successfully');
                return SignUp();
              } else {
                print('=========> Loading');
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            }));
  }
}
