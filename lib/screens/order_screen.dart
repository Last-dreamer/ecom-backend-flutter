import 'package:ecom_admin/controller/order_controller.dart';
import 'package:ecom_admin/models/order_model.dart';
import 'package:ecom_admin/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => (orderController.ordersPending.length == 0)
                ? const Center(
                    child: Text("No Items in Pending .........."),
                  )
                : ListView.builder(
                    itemCount: orderController.ordersPending.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OrderCard(
                            order: orderController.ordersPending[index]),
                      );
                    }),
          ))
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productOrders = Product.products
        .where((product) => order.productId.contains(product.id))
        .toList();

    OrderController orderController = Get.find();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order id: ${order.id}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("dd-MM-yyyy").format(order.createAt),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productOrders.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                          productOrders[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            productOrders[index].name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 280,
                            child: Text(
                              productOrders[index].description,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Delivery Fee",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$${order.deliveryFee}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$${order.total}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order.isAccepted
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.black,
                              minimumSize: const Size(160, 40)),
                          onPressed: () {
                            orderController.updateOrder(
                                order, "isDelivered", !order.isDelivered);
                          },
                          child: const Text(
                            "Deliver",
                            style: TextStyle(fontSize: 14),
                          ))
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.black,
                              minimumSize: const Size(160, 40)),
                          onPressed: () {
                            orderController.updateOrder(
                                order, "isAccepted", !order.isAccepted);
                          },
                          child: const Text(
                            "Accept",
                            style: TextStyle(fontSize: 14),
                          )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.black,
                          minimumSize: const Size(160, 40)),
                      onPressed: () {
                        orderController.updateOrder(
                            order, "isCancelled", !order.isCanceled);
                      },
                      child: const Text(
                        "Cancled",
                        style: TextStyle(fontSize: 14),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
