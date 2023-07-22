import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/login_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.grey,
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/login_image.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  const Text(
                    "Nguyễn Bá Hiếu",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Text(
                    "nghesitin2003@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            )),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Profile"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart_outlined),
          title: const Text("Your cart"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text("Purchase History"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Log out"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        )
      ]),
    );
  }
}
