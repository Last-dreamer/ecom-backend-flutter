import 'package:ecom_admin/models/product_model.dart';
import 'package:ecom_admin/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  DataBaseServices dataBaseServices =  DataBaseServices();

  @override
  void onInit() {
    products.bindStream(dataBaseServices.getProducts());
    super.onInit();
  }
  var newProducts =  {}.obs;

  // for slider to update
  get price => newProducts["price"];
  get quantity => newProducts["quantity"];

  // for checkbox
  get isRecommended => newProducts["isRecommended"];
  get isPopular => newProducts["isPopular"];

  void updateProductPrice(int index, Product product, double value) {
    product.price = value;
    products[index] = product;
  }

  void saveNewProductPrice(Product product, String field, double newValue){
    dataBaseServices.updateProduct(product, field, newValue);
  }

  void saveNewProductQuantity(Product product, String field, int newValue){
    dataBaseServices.updateProduct(product, field, newValue);
  }

  void updateProductQuantity(int index, Product product, int value){
    product.quantity = value;
    products[index] = product;
  }
}
