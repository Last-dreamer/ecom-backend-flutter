import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int id;
  final int CustomerId;
  final List<int> productId;
  final double deliveryFee;
  final double subTotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final DateTime createAt;

  const OrderModel(
      {required this.id,
      required this.CustomerId,
      required this.productId,
      required this.deliveryFee,
      required this.subTotal,
      required this.total,
      required this.isAccepted,
      required this.isDelivered,
      required this.createAt});

  OrderModel copyWith(
      {int? id,
      int? CustomerId,
      List<int>? productId,
      double? deliveryFee,
      double? subTotal,
      double? total,
      bool? isAccepted,
      bool? isDelivered,
      DateTime? createAt}) {
    return OrderModel(
        id: id ?? this.id,
        CustomerId: CustomerId ?? this.CustomerId,
        productId: productId ?? this.productId,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        subTotal: subTotal ?? this.subTotal,
        total: total ?? this.total,
        isAccepted: isAccepted ?? this.isAccepted,
        isDelivered: isDelivered ?? this.isDelivered,
        createAt: createAt ?? this.createAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'CustomerId': CustomerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'subTotal': subTotal,
      'total': total,
      'isAccepted': isAccepted,
      'isDelivered': isDelivered,
      'createAt': createAt
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        id: map['id'],
        CustomerId: map['CustomerId'],
        productId: List<int>.from(map['productId']),
        deliveryFee: map['deliveryFee'],
        subTotal: map['subTotal'],
        total: map['total'],
        isAccepted: map['isAccepted'],
        isDelivered: map['isDelivered'],
        createAt: DateTime.parse(map['createAt']));
  }

  static List<OrderModel> order = [
    OrderModel(
        id: 1,
        CustomerId: 1,
        productId: [1, 2, 3],
        deliveryFee: 10,
        subTotal: 100,
        total: 110,
        isAccepted: true,
        isDelivered: true,
        createAt: DateTime.now()),
    OrderModel(
        id: 2,
        CustomerId: 2,
        productId: [1, 2, 3],
        deliveryFee: 10,
        subTotal: 100,
        total: 110,
        isAccepted: true,
        isDelivered: true,
        createAt: DateTime.now()),
  ];

  @override
  List<Object?> get props => [];
}
