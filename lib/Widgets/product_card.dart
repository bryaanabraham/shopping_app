import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //colour must be inside decoration if colour is there, cannot be outside decoration.
        color: const Color.fromARGB(197, 228, 232, 232),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          Text(
            'Rs ${price.toStringAsFixed(0)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 130,
            ),
          )
        ],
      ),
    );
  }
}
