import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/product.dart';
import './models/type.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  Type type;
  ProductScreen(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(type.name.toString()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: GetProduct(type),
    );
  }
}

class GetProduct extends StatefulWidget {
  Type type;
  GetProduct(this.type, {super.key});
  @override
  State<GetProduct> createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchProduct(http.Client()),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        print(snapshot);
        return snapshot.hasData
            ? ProductList(products: snapshot.data, type: widget.type)
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product>? products;
  final Type? type;
  const ProductList({this.products, this.type, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> productWithType =
        products!.where((element) => element.type == type!.type).toList();
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 5 / 4,
            mainAxisSpacing: 25,
            crossAxisSpacing: 25),
        itemCount: productWithType.length,
        itemBuilder: (context, index) {
          final product = productWithType[index];
          return Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return InkWell(
                onTap: () {
                  print("You click on ${product.name}");
                  final productInCart = cartProvider.productInCart;
                  bool check = productInCart.containsKey(product);
                  if (check) {
                    cartProvider.addNumberOfProduct(product);
                  } else {
                    cartProvider.addProductInCart(product);
                  }
                },
                overlayColor: const MaterialStatePropertyAll(Colors.grey),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color.fromARGB(255, 169, 206, 236),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "https://nghesitin-backendfoodapp.onrender.com/upload/${product.image}",
                            fit: BoxFit.fill,
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(product.name.toString()),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(product.price.toString()),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text("Add to cart"),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
