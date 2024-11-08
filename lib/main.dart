import 'package:bussapp/LoginPage.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Platform.isAndroid
//           options: const FirebaseOptions(
//               apiKey: "AIzaSyCc9VcKTMPXva-GNv27wWEX6g7ud8cKHCM",
//               appId: "1:978660908795:android:20d75ec3bffdea552b1a5e",
//               messagingSenderId: "978660908795",
//               projectId: "busapp-ebe8c"))
//       : await Firebase.initializeApp();

//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.black, centerTitle: true),
      ),
      home: const LoginPage(),
    );
  }
}
