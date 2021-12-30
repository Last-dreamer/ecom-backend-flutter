import 'package:ecom_admin/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  var newProducts =  {}.obs;

  get price => newProducts["price"];
  get quantity => newProducts["quantity"];

  get isRecommended => newProducts["isRecommended"];
  get isPopular => newProducts["isPopular"];

  void updateProductPrice(int index, Product product, double value) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(int index, Product product, int value){
    product.quantity = value;
    products[index] = product;
  }
}
