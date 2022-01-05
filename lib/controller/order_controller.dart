import 'package:ecom_admin/models/order_model.dart';
import 'package:ecom_admin/services/database_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  DataBaseServices dataBaseServices = DataBaseServices();

  var orders = <OrderModel>[].obs;
  var ordersPending = <OrderModel>[].obs;

  @override
  void onInit() {
    orders.bindStream(dataBaseServices.getOrders());
    ordersPending.bindStream(dataBaseServices.getOrdersPending());
    super.onInit();
  }

  void updateOrder(OrderModel order, String field, bool newValue) {
    dataBaseServices.updateOrder(order, field, newValue);
  }
}
