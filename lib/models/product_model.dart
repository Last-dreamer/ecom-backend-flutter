import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  double price;
  int quantity;

   Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.isRecommended,
      required this.isPopular,
      this.price = 0,
      this.quantity = 0});

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imageUrl,
        isRecommended,
        isPopular,
        price,
        quantity
      ];

  Product copyWith(
      {int? id,
      String? name,
      String? category,
      String? description,
      String? imageUrl,
      bool? isRecommended,
      bool? isPopular,
      double? price,
      int? quantity}) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        isRecommended: isRecommended ?? this.isRecommended,
        isPopular: isPopular ?? this.isPopular,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "description": description,
      "imageUrl": imageUrl,
      "isRecomended": isRecommended,
      "isPopular": isPopular,
      "price": price,
      "quantity": quantity
    };
  }

  factory Product.fromSnap(Map<String, dynamic>? snapshot) {
    return Product(
        id: snapshot?['id'] ?? 0,
        name: snapshot?['name'],
        category: snapshot?['category'],
        description: snapshot?['description'] ?? "",
        imageUrl: snapshot?['imageUrl'],
        isRecommended: snapshot?['isRecommended'] ?? false,
        isPopular: snapshot?['isPopular'] ?? false,
        price: snapshot?['price'] ?? 0,
        quantity: snapshot?['quantity'] ?? 1);
  }

  String toJson() => json.encode(toMap());


  @override
  bool get stringify => true;


  static List<Product> products = [
       Product(
        name: 'pepsi',
        description: "loram ip some         sh.com/photo-1553 lfHx",
        category: 'pepsi',
        imageUrl:
        "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        price: 10,
        isRecommended: true,
        isPopular: false, id: 1,),

       Product(
      name: 'pepsi',
      description: "loram ip some         sh.com/photo-1553 lfHx",
      category: 'pepsi',
      imageUrl:
      "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      price: 10,
      isRecommended: true,
      isPopular: false, id: 1,),

       Product(
      name: 'pepsi 3',
      description: "loram ip some  htsdf",
      category: 'pepsi',
      imageUrl:
      "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      price: 10,
      isRecommended: true,
      isPopular: false, id: 3,),

  ];

}
