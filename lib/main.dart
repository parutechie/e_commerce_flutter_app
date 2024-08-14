import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infinity/services/check_auth.dart';
import 'package:infinity/services/firebase_options.dart';
import 'package:infinity/providers/auth_provider.dart';
import 'package:infinity/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase initalization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
    );
  }
}
