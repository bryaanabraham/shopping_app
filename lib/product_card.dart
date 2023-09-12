import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title, image;
  final double price;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(201, 86, 246, 238),
      child: Column(
        children: [
          Text(title),
          const SizedBox(height: 5),
          Text('Rs $price'),
          const SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(image),
            height: 150,
          )
        ],
      ),
    );
  }
}
