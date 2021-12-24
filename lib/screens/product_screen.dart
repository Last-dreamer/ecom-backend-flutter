import 'package:ecom_admin/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: Product.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 195,
                        child: ProductCart(product: Product.products[index]));
                  }),
            ),


          ],
        ),
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  final Product product;

  const ProductCart({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            Text(
              product.description,
              style: const TextStyle(fontSize: 14,),
            ),

            const SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(product.imageUrl, fit: BoxFit.cover,),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 5,),
                          const SizedBox(
                              width: 50,
                              child:  Text("Price",   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),

                          SizedBox(
                            width: 175,
                            child: Slider(value: product.price,
                                min: 0,
                                max: 25,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black26,
                                onChanged: (value){}),
                          ),
                          Text("\$${product.price.toStringAsFixed(1)}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [

                          const SizedBox(width: 5,),
                            const SizedBox(
                                width: 50,
                                child: Text("Qty.",   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),

                          SizedBox(
                            width: 175,
                            child: Slider(value: product.quantity.toDouble(),
                                min: 0,
                                max: 100,
                                divisions: 10,
                                activeColor: Colors.black,
                                inactiveColor: Colors.black26,
                                onChanged: (value){}),
                          ),
                          Text("\$${product.quantity.toInt()}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
