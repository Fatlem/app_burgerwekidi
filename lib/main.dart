import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login.dart';
import 'dashboard.dart';
import 'update_user.dart';
import 'register.dart';
import 'cart.dart';
import 'checkout.dart';
import 'payment.dart';
import 'thankyou.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fatlem Wekidi くん',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/dashboard': (context) => Dashboard(),
        '/update-user': (context) => UpdateUser(),
        '/cart': (context) => Cart(cartItems: []),
        '/checkout': (context) => Checkout(),
        '/payment': (context) => Payment(),
        '/thankyou': (context) => ThankYouScreen(),
        '/profile': (context) => Profile(), // Tambahkan rute untuk halaman profil
      },
    );
  }
}
