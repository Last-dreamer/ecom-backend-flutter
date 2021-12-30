import 'package:ecom_admin/screens/home_screen.dart';
import 'package:ecom_admin/screens/new_product_screen.dart';
import 'package:ecom_admin/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      ],
    );
  }
}
