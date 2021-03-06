import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin/screens/home_screen.dart';
import 'package:ecom_admin/screens/new_product_screen.dart';
import 'package:ecom_admin/screens/order_screen.dart';
import 'package:ecom_admin/screens/product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My eCommerce Backend",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: "/products", page: () => ProductScreen()),
        GetPage(name: "/products/new", page: () =>   NewPrdouctScreen()),
        GetPage(name: "/order", page: () =>   OrderScreen()),
      ],
    );
  }
}
