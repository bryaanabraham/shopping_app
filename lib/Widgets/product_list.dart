import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/Widgets/product_card.dart';
import 'package:shopping_app/Pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Nike',
    'Puma',
    'Under Armour',
    'Adidas',
    'Reebok',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Shoes\nCollection',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      //expanded takes the remaining space on the screen in the row or column
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: filters.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final filter = filters[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = filter;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedFilter == filter
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color.fromRGBO(245, 247, 249, 1),
                              side: const BorderSide(
                                color: Color.fromRGBO(215, 215, 215, 1),
                              ),
                              label: Text(
                                filter,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              labelStyle: const TextStyle(fontSize: 16),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 569.5,
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetails(product: product);
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product['title'] as String,
                            price: product['Price'] as double,
                            image: product['imageURL'] as String,
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
