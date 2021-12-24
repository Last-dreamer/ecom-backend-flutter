import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;
  final double price;
  final double quantity;

  const Product(
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
      double? quantity}) {
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

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        name: map['name'],
        category: map['category'],
        description: map['description'],
        imageUrl: map['imageUrl'],
        isRecommended: map['isRecommended'],
        isPopular: map['isPopular'],
        price: map['price'],
        quantity: map['quantity']);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  bool get stringify => true;


  static List<Product> products = [
    const  Product(
        name: 'pepsi',
        description: "loram ip some         sh.com/photo-1553 lfHx",
        category: 'pepsi',
        imageUrl:
        "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        price: 10,
        isRecommended: true,
        isPopular: false, id: 1,),

    const  Product(
      name: 'pepsi',
      description: "loram ip some         sh.com/photo-1553 lfHx",
      category: 'pepsi',
      imageUrl:
      "https://images.unsplash.com/photo-1553456558-aff63285bdd1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      price: 10,
      isRecommended: true,
      isPopular: false, id: 1,),

    const  Product(
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
