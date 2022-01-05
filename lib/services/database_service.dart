import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin/models/order_model.dart';
import 'package:ecom_admin/models/product_model.dart';

class DataBaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<OrderModel>> getOrders() {
    return firebaseFirestore.collection("orders").snapshots().map((s) {
      return s.docs.map((doc) {
        return OrderModel.fromMap(doc.data());
      }).toList();
    });
  }

  Stream<List<OrderModel>> getOrdersPending() {
    return firebaseFirestore
        .collection("orders")
        .where("isDelivered", isEqualTo: false)
        .where("isCancelled", isEqualTo: false)
        .snapshots()
        .map((s) {
      return s.docs.map((doc) {
        return OrderModel.fromMap(doc.data());
      }).toList();
    });
  }

  Future<void> updateOrder(OrderModel order, String field, dynamic newValue) {
    return firebaseFirestore
        .collection("orders")
        .where("id", isEqualTo: order.id)
        .get()
        .then((qs) => qs.docs.first.reference.update({field: newValue}));
  }

  Stream<List<Product>> getProducts() {
    return firebaseFirestore.collection("products").snapshots().map((s) {
      return s.docs.map((doc) {
        print("testting ... ${doc.data()}");
        return Product.fromSnap(doc.data());
      }).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return firebaseFirestore.collection("products").add(product.toMap());
  }

  Future<void> updateProduct(Product product, String field, dynamic newValue) {
    return firebaseFirestore
        .collection("products")
        .where("id", isEqualTo: product.id)
        .get()
        .then((qs) => qs.docs.first.reference.update({field: newValue}));
  }
}
