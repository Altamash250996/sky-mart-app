import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';

class EditProductScreen extends StatefulWidget {
  static const String routeName = '/edit-product';
  final Product product;
  const EditProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'View Product',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CarouselSlider(
                  items: widget.product.images.map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) => Image.network(
                          i,
                          fit: BoxFit.contain,
                          height: 200,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 300,
                  ),
                ),
                const SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     IconButton(
                //       onPressed: () => {},
                //       // onPressed: () => Navigator.pushNamed(
                //       //   context,
                //       //   EditProductScreen.routeName,
                //       //   arguments: productData,
                //       // ),
                //       icon: const Icon(
                //         Icons.edit,
                //       ),
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Product Name : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(child: Text(widget.product.name)),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Product Description : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Flexible(
                          child: Text(widget.product.description),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Product Quantity : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${widget.product.quantity}'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Product Price : ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${widget.product.price}'),
                      ],
                    ),
                  ],
                ),
                // EditTextField(
                //   controller: productNameController,
                //   hintText: 'Product Name',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
