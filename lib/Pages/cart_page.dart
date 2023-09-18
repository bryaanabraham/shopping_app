import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartItem['imageURL'].toString()),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete product',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text(
                          'Are you sure you want to delete this product from the cart?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .rmProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  // Provider.of<CartProvider>(context, listen: false)
                  //     .rmProduct(widget.product);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                'Size ${cartItem['size']}',
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ));
  }
}
