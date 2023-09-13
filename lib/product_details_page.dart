import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.product['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Image.asset(widget.product['imageURL'] as String),
              const Spacer(flex: 2),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 247, 249, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Rs ${widget.product['Price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (widget.product['size'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['size'] as List<int>)[index];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
