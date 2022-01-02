
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin/models/product_model.dart';

class DataBaseServices {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts(){
    return firebaseFirestore.collection("products").snapshots().map((s) {
      return s.docs.map((doc) {
        print("testting ... ${doc.data()}");
        return Product.fromSnap(doc.data());}).toList();
    } );
  }


  Future<void> addProduct(Product product){
    return firebaseFirestore.collection("products").add(product.toMap());
  }

  Future<void> updateProduct(Product product, String field, dynamic newValue) {
    return firebaseFirestore.collection("products").where("id",  isEqualTo: product.id).get()
        .then((qs) => qs.docs.first.reference.update({field: newValue}));
  }
}