import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:re_pr2_aryan_1336/provider/cartProvider.dart';
import 'package:re_pr2_aryan_1336/provider/home_provider.dart';
import 'package:re_pr2_aryan_1336/screen/Log_in.dart';
import 'package:re_pr2_aryan_1336/screen/cart_page.dart';
import 'package:re_pr2_aryan_1336/screen/home_page.dart';
import 'package:re_pr2_aryan_1336/screen/item_page.dart';
import 'package:re_pr2_aryan_1336/screen/sign_in.dart';
import 'package:re_pr2_aryan_1336/utils/myroutes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApiProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(149, 171, 71, 1),
          )),
      routes: {
        MyRoutes.LogINPage: (context) => LoginPage(),
        MyRoutes.SingInPage: (context) => SingInPage(),
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.CartPage: (context) => const CartPAge(),
        MyRoutes.itemPage: (context) => const ItemPage(),
      },
    );
  }
}
