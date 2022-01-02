import 'dart:io';

import 'package:ecom_admin/controller/product_controller.dart';
import 'package:ecom_admin/models/product_model.dart';
import 'package:ecom_admin/services/database_service.dart';
import 'package:ecom_admin/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewPrdouctScreen extends StatelessWidget {
  NewPrdouctScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.find();

  StorageServices storageServices = StorageServices();
  DataBaseServices dataBaseServices = DataBaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Add a new product"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Card(
                      color: Colors.black,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              var _picker = ImagePicker();
                              var _image = await _picker.pickImage(
                                  source: ImageSource.gallery);

                              if (_image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("No Image was selected")));
                              }
                              if (_image != null) {
                                await storageServices.uploadImage(_image);
                                var imageUrl = await storageServices
                                    .getDownloadUrl(_image.name);

                                productController.newProducts.update(
                                    "imageUrl", (value) => imageUrl,
                                    ifAbsent: () => imageUrl);
                              }
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Add an Image",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "Product Information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  _buildTextFormField("Product Id", "id", productController),
                  Container(
                    height: 20,
                  ),
                  _buildTextFormField("Product Name", "name", productController),
                  Container(
                    height: 20,
                  ),
                  _buildTextFormField(
                      "Product Category", "category", productController),
                  Container(
                    height: 20,
                  ),
                  _buildTextFormField(
                      "Product Description", "description", productController),
                  Container(
                    height: 20,
                  ),
                  _buildSlider(
                      "Price", "price", productController, productController.price),
                  _buildSlider("Qauntity", "quantity", productController,
                      productController.quantity),
                  Container(
                    height: 10,
                  ),
                  _buildCheckBox("Recommended", "isRecommended", productController,
                      productController.isRecommended),
                  _buildCheckBox("Popular", "isPopular", productController,
                      productController.isPopular),
                  Container(
                    height: 10,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            print("test ${productController.newProducts}");
                            dataBaseServices.addProduct(Product(
                                id: int.parse(productController.newProducts['id']),
                                name: productController.newProducts['name'],
                                category: productController.newProducts['category'],
                                description: productController.newProducts['description'],
                                imageUrl: productController.newProducts['imageUrl'],
                                isRecommended: productController.newProducts['isRecommended'],
                                isPopular: productController.newProducts['isPopular'],
                                price: productController.newProducts['price'],
                               quantity: productController.newProducts['quantity'].toInt()
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black, shape: const StadiumBorder()),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildCheckBox(String title, String name,
      ProductController productController, bool? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Checkbox(
            value: (controllerValue == null) ? false : controllerValue,
            checkColor: Colors.black,
            activeColor: Colors.black12,
            onChanged: (change) {
              productController.newProducts
                  .update(name, (_) => change, ifAbsent: () => change);
            })
      ],
    );
  }

  Row _buildSlider(String title, String name,
      ProductController productController, double? controllerValue) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 175,
            child: Slider(
                value: (controllerValue == null) ? 0 : controllerValue,
                min: 0,
                max: 25,
                divisions: 10,
                activeColor: Colors.black,
                inactiveColor: Colors.black26,
                onChanged: (value) {
                  // ifAbsent mean if the key is not yet availible then we will add it ..
                  productController.newProducts
                      .update(name, (_) => value, ifAbsent: () => value);
                }),
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
      String hintText, String name, ProductController productController) {
    return TextFormField(
      onChanged: (change) {
        productController.newProducts
            .update(name, (_) => change, ifAbsent: () => change);
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
