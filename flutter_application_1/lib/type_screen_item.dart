import 'package:flutter/material.dart';
import 'package:flutter_application_1/product_screen.dart';
import './models/type.dart';

// ignore: must_be_immutable
class TypeScreenItem extends StatelessWidget {
  Type type;
  TypeScreenItem(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(type),
            ))
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      type.image.toString(),
                      width: 300,
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(type.name.toString())
          ],
        ),
      ),
    );
  }
}
