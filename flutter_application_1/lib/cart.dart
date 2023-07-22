// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import './models/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        List<Product> product = cartProvider.productInCart.keys.toList();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("My cart"),
            backgroundColor: Colors.grey,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              cartProvider.removeProductIncart(product[index]);
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          )
                        ]),
                        child: ListTile(
                            leading: Image(
                                image: NetworkImage(
                                    "https://nghesitin-backendfoodapp.onrender.com/upload/${product[index].image}")),
                            title: Text('${product[index].name}'),
                            subtitle: Text(
                                '${int.parse(product[index].price!) * cartProvider.productInCart[product[index]]!}'),
                            trailing: SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartProvider
                                            .reduceProuctInCart(product[index]);
                                      },
                                      icon: const Icon(Icons
                                          .keyboard_double_arrow_down_rounded)),
                                  Text(
                                      '${cartProvider.productInCart[product[index]]}'),
                                  IconButton(
                                      onPressed: () {
                                        cartProvider
                                            .addNumberOfProduct(product[index]);
                                      },
                                      icon: const Icon(Icons
                                          .keyboard_double_arrow_up_rounded)),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text('Total: ${cartProvider.total}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      labelText: "Enter your address"),
                                ),
                                const SizedBox(height: 20),
                                Text("Total ${cartProvider.total}"),
                                ElevatedButton(
                                    onPressed: () {
                                      cartProvider.clearAll();
                                      Navigator.pop(context);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: Text("Buyyyyyyyy"),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        child: Text("Buy"),
                      ))
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
