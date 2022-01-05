import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int id;
  final int customerId;
  final List<int> productId;
  final double deliveryFee;
  final double subTotal;
  final double total;
  final bool isAccepted;
  final bool isCanceled;
  final bool isDelivered;
  final DateTime createAt;

  const OrderModel(
      {required this.id,
      required this.customerId,
      required this.productId,
      required this.deliveryFee,
      required this.subTotal,
      required this.total,
      required this.isAccepted,
      required this.isCanceled,
      required this.isDelivered,
      required this.createAt});

  OrderModel copyWith(
      {int? id,
      int? customerId,
      List<int>? productId,
      double? deliveryFee,
      double? subTotal,
      double? total,
      bool? isAccepted,
      bool? isCanceled,
      bool? isDelivered,
      DateTime? createAt}) {
    return OrderModel(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        productId: productId ?? this.productId,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        subTotal: subTotal ?? this.subTotal,
        total: total ?? this.total,
        isAccepted: isAccepted ?? this.isAccepted,
        isCanceled: isCanceled ?? this.isCanceled,
        isDelivered: isDelivered ?? this.isDelivered,
        createAt: createAt ?? this.createAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'CustomerId': customerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'subTotal': subTotal,
      'total': total,
      'isAccepted': isAccepted,
      'isCanceled': isCanceled,
      'isDelivered': isDelivered,
      'createAt': createAt
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        id: map['id'],
        customerId: map['customerId'],
        productId: List<int>.from(map['productId']),
        deliveryFee: map['deliveryFee'],
        subTotal: map['subTotal'],
        total: map['total'],
        isAccepted: map['isAccepted'],
        isCanceled: map['isCanceled'] ?? false,
        isDelivered: map['isDelivered'],
        createAt: map['createAt'].toDate());
  }

  static List<OrderModel> order = [
    OrderModel(
        id: 1,
        customerId: 1,
        productId: [1, 2, 3],
        deliveryFee: 10,
        subTotal: 100,
        total: 110,
        isAccepted: true,
        isCanceled: false,
        isDelivered: true,
        createAt: DateTime.now()),
    OrderModel(
        id: 2,
        customerId: 2,
        productId: [1, 2, 3],
        deliveryFee: 10,
        subTotal: 100,
        total: 110,
        isAccepted: true,
        isCanceled: false,
        isDelivered: true,
        createAt: DateTime.now()),
  ];

  @override
  List<Object?> get props => [];
}
