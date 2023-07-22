import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'models/product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class CartProvider extends ChangeNotifier {
  final Map<Product, int> productInCart = {};
  int total = 0;
  void addNumberOfProduct(Product product) {
    productInCart.update(product, (value) => value + 1);
    total = 0;
    totalPrice();
    notifyListeners();
  }

  void addProductInCart(Product product) {
    productInCart[product] = 1;
    total = 0;
    totalPrice();
    notifyListeners();
  }

  void reduceProuctInCart(Product product) {
    if (productInCart[product]! > 0) {
      productInCart.update(product, (value) => value - 1);
      total = 0;
      totalPrice();
    }
    notifyListeners();
  }

  void removeProductIncart(Product product) {
    productInCart.remove(product);
    total = 0;
    totalPrice();
    notifyListeners();
  }

  void clearAll() {
    productInCart.clear();
    total = 0;
    notifyListeners();
  }

  void totalPrice() {
    productInCart.forEach((key, value) {
      total += int.parse(key.price!) * value;
    });
  }
}
