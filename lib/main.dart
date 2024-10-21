import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autentication/firebase_options.dart';
import 'package:flutter_autentication/presentation/user_registration/views/user_registration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Firebase',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserRegistrationPage(),
    );
  }
}
