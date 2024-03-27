import 'package:flutter/material.dart';
import 'package:photo_call/provider/helper_provider.dart';
import 'package:photo_call/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_) => HelperProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/create': (context) => const EditScreen(
                isNew: true,
              ),
          '/edit': (context) => const EditScreen(
                isNew: false,
              )
        });
  }
}
