import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project123/dashboard.dart';
import 'package:project123/login.dart';
import 'package:project123/navbar.dart';
import 'package:project123/register.dart';
import 'Home.dart';
import 'RouteConstants.dart';
import 'firebase_options.dart';
import 'message.dart';
import 'Cart.dart';
import 'Contact.dart';
import 'Discover.dart';
// import 'create_account.dart';
import 'splash.dart';
import 'order.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();
  runApp(MyApp());
}
void initializeFirebase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 253, 182, 206),
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue[100],
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
    initialRoute: RouteConstants.initialRoute,
    routes: {
    RouteConstants.homeRoute: (context) => Home(),
    RouteConstants.contactRoute: (context) => Contact(),
    RouteConstants.messageRoute: (context) => Message(),
    RouteConstants.cartRoute: (context) => Cart(),
    RouteConstants.discoverRoute: (context) => Discover(),
    RouteConstants.loginRoute: (context) => Login(),
    RouteConstants.DashRoute:(context)=>Dashboard(),
    RouteConstants.initialRoute: (context) => Splash(),
    RouteConstants.orderRoute: (context) => order(),
      RouteConstants.registerRoute: (context) => Register()

  },




    );
  }
}

class MyBottomNavBarApp extends StatefulWidget {
  @override
  _MyBottomNavBarAppState createState() => _MyBottomNavBarAppState();
}


class _MyBottomNavBarAppState extends State<MyBottomNavBarApp> {
  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}












